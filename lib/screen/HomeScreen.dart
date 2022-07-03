

import 'package:blue_print_pos/blue_print_pos.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'dart:typed_data';

import 'package:blue_print_pos/blue_print_pos.dart';
import 'package:blue_print_pos/models/models.dart';
import 'package:blue_print_pos/receipt/receipt.dart';
import 'package:flutter/services.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  final BluePrintPos _bluePrintPos = BluePrintPos.instance;
  List<BlueDevice> _blueDevices = <BlueDevice>[];
  BlueDevice? _selectedDevice;
  bool _isLoading = false;
  int _loadingAtIndex = -1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xing Xing Tableware cleaning'),
        actions: [IconButton(onPressed: () {

        }, icon: Icon(Icons.refresh))],
      ),
      body: SafeArea(
        child: _isLoading && _blueDevices.isEmpty
            ? const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        )
            : _blueDevices.isNotEmpty
            ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: List<Widget>.generate(_blueDevices.length,
                        (int index) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: _blueDevices[index].address ==
                                  (_selectedDevice?.address ?? '')
                                  ? _onDisconnectDevice
                                  : () => _onSelectDevice(index),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _blueDevices[index].name,
                                      style: TextStyle(
                                        color: _selectedDevice?.address ==
                                            _blueDevices[index]
                                                .address
                                            ? Colors.blue
                                            : Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      _blueDevices[index].address,
                                      style: TextStyle(
                                        color: _selectedDevice?.address ==
                                            _blueDevices[index]
                                                .address
                                            ? Colors.blueGrey
                                            : Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (_loadingAtIndex == index && _isLoading)
                            Container(
                              height: 24.0,
                              width: 24.0,
                              margin: const EdgeInsets.only(right: 8.0),
                              child: const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue,
                                ),
                              ),
                            ),
                          if (!_isLoading &&
                              _blueDevices[index].address ==
                                  (_selectedDevice?.address ?? ''))
                            TextButton(
                              onPressed: _onPrintReceipt,
                              child: Container(
                                color: _selectedDevice == null
                                    ? Colors.grey
                                    : Colors.blue,
                                padding: const EdgeInsets.all(8.0),
                                child: const Text(
                                  'Test Print',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(
                                        MaterialState.pressed)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5);
                                    }
                                    return Theme.of(context).primaryColor;
                                  },
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Scan bluetooth device',
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
              Text(
                'Press button scan',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _onScanPressed,
        child: const Icon(Icons.search),
        backgroundColor: _isLoading ? Colors.grey : Colors.blue,
      ),


    );
  }

  Future<void> _onScanPressed() async {
    setState(() => _isLoading = true);
    _bluePrintPos.scan().then((List<BlueDevice> devices) {
      if (devices.isNotEmpty) {
        setState(() {
          _blueDevices = devices;
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
      }
    });
  }

  void _onDisconnectDevice() {
    _bluePrintPos.disconnect().then((ConnectionStatus status) {
      if (status == ConnectionStatus.disconnect) {
        setState(() {
          _selectedDevice = null;
        });
      }
    });
  }

  void _onSelectDevice(int index) {
    setState(() {
      _isLoading = true;
      _loadingAtIndex = index;
    });
    final BlueDevice blueDevice = _blueDevices[index];
    _bluePrintPos.connect(blueDevice).then((ConnectionStatus status) {
      if (status == ConnectionStatus.connected) {
        setState(() => _selectedDevice = blueDevice);
      } else if (status == ConnectionStatus.timeout) {
        _onDisconnectDevice();
      } else {
        print('$runtimeType - something wrong');
      }
      setState(() => _isLoading = false);
    });
  }

  Future<void> _onPrintReceipt() async {
    /// Example for Print Image
    // final ByteData logoBytes = await rootBundle.load(
    //   'assets/logo.jpg',
    // );

    /// Example for Print Text
    final ReceiptSectionText receiptText = ReceiptSectionText();
    // receiptText.addImage(
    //   base64.encode(Uint8List.view(logoBytes.buffer)),
    //   width: 150,
    // );
    // receiptText.addSpacer();
    receiptText.addText(
      'ရှင်းရှင်း',
      size: ReceiptTextSizeType.medium,
      style: ReceiptTextStyleType.bold,
    );
    receiptText.addText(
      'ပိုးသတ်ပန်းကန်',
      size: ReceiptTextSizeType.small,
    );
    receiptText.addSpacer(useDashed: true);
    receiptText.addLeftRightText('Time', '18/06/22, 10:00');
    receiptText.addSpacer(useDashed: true);
    receiptText.addLeftRightText(
      'ထမင်းစား ပန်းကန် ',
      '250 ကျပ် ',
      leftStyle: ReceiptTextStyleType.normal,
      rightStyle: ReceiptTextStyleType.bold,
    );
    receiptText.addSpacer(useDashed: true);
    receiptText.addLeftRightText(
      'TOTAL',
      '250 ကျပ် ',
      leftStyle: ReceiptTextStyleType.normal,
      rightStyle: ReceiptTextStyleType.bold,
    );
    receiptText.addSpacer(useDashed: true);
    receiptText.addLeftRightText(
      'Payment',
      'Cash',
      leftStyle: ReceiptTextStyleType.normal,
      rightStyle: ReceiptTextStyleType.normal,
    );
    receiptText.addSpacer(count: 2);

    await _bluePrintPos.printReceiptText(receiptText);

    /// Example for print QR
    // await _bluePrintPos.printQR('www.google.com', size: 250);

    /// Text after QR
    final ReceiptSectionText receiptSecondText = ReceiptSectionText();
    receiptSecondText.addText('Powered by xingxing',
        size: ReceiptTextSizeType.small);
    // receiptSecondText.addSpacer();
    await _bluePrintPos.printReceiptText(receiptSecondText, feedCount: 1);
  }
}
