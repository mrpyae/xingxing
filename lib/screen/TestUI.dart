import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:xingxing/screen/HomeScreen.dart';
import 'package:xingxing/screen/ItemGroup.dart';
import 'package:xingxing/screen/ItemView.dart';
import 'package:xingxing/screen/LoginUI.dart';
import 'package:xingxing/screen/OrganizationView.dart';
import 'package:xingxing/screen/UserView.dart';

class TestUI extends StatefulWidget {
  const TestUI({Key? key}) : super(key: key);

  @override
  State<TestUI> createState() => _TestUIState();
}

class _TestUIState extends State<TestUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test UI"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
            onTap: ()=>Get.to(()=>LoginUI()),
              title: Text("Log In UI"),
            ),
            ListTile(
            onTap: ()=>Get.to(()=>HomeScreen()),
              title: Text("Print Test"),
            ),
            ListTile(
            onTap: ()=>Get.to(()=>ItemView()),
              title: Text("TableWare Item View"),
            ),
            ListTile(
            onTap: ()=>Get.to(()=>UserView()),
              title: Text("Users View"),
            ),
            ListTile(
            onTap: ()=>Get.to(()=>OrganizationView()),
              title: Text("shop/Restaurant View"),
            ), ListTile(
            onTap: ()=>Get.to(()=>ItemGroup()),
              title: Text("Item Set"),
            ),

          ],
        ),
      ),
    );
  }
}
