import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xingxing/Controller/AppController.dart';

class ItemView extends StatefulWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  AppController ac = Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchitems();
  }
  fetchitems()async{
    bool b = await ac.getAllItem();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item View"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListTile(
          trailing: ElevatedButton(onPressed: (){},child: Text("Add New Item"),),
        ),
      ),
      body: GetBuilder<AppController>(

        builder: (app) {
          return ListView.builder(
              itemCount: app.lstitems.length,
              itemBuilder: (context,index)=>Card(child: ListTile(
                leading: (app.lstitems.elementAt(index).itemPhoto==null)?Container(
                    width: 70,
                    child: Image.asset('assets/images/nophoto.jpeg')):Container(
                    width: 70,
                    child: Image.network(app.lstitems.elementAt(index).itemPhoto!)),
                trailing: IconButton(icon: Icon(Icons.edit,color: Colors.pink,),onPressed: (){},),
                title: Text(app.lstitems.elementAt(index).itemname!),
                subtitle: Text(app.lstitems.elementAt(index).unitprice! + " ကျပ်"),
              )));
        }
      )
    );
  }
}
