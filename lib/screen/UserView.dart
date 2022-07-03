import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xingxing/Controller/AppController.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  AppController ac = Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchallusers();
  }
  fetchallusers()async{
  bool b = await ac.getallusers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListTile(
          trailing: ElevatedButton(onPressed: (){},child: Text("Add New User"),),
        ),
      ),
      body: GetBuilder<AppController>(

        builder: (app) {
          return ListView.builder(
              itemCount: app.lstusers.length,
              itemBuilder: (context,index)=>Card(
                child: ListTile(
            title: Text(app.lstusers.elementAt(index).userName!,style: TextStyle(fontWeight: FontWeight.bold),),
                  trailing: Text(app.lstusers.elementAt(index).userType!),
                  subtitle: Text(app.lstusers.elementAt(index).loginId!),
          ),
              ));
        }
      ),
    );
  }
}
