import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:xingxing/Controller/AppController.dart';
import 'package:xingxing/Util/AppConstants.dart';
import 'package:xingxing/screen/HomeScreen.dart';
import 'package:xingxing/screen/TestUI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xing Xing Tableware Cleaning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: AppConstants().appColor
      ),
      // home: HomeScreen(),
        home: TestUI()
    );
  }
}

