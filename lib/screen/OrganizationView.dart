import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xingxing/Controller/AppController.dart';
import 'package:xingxing/screen/UsersByOrganization.dart';

class OrganizationView extends StatefulWidget {
  const OrganizationView({Key? key}) : super(key: key);

  @override
  State<OrganizationView> createState() => _OrganizationViewState();
}

class _OrganizationViewState extends State<OrganizationView> {
  AppController ac = Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchorganization();
  }
  fetchorganization()async{
      bool b = await ac.getAllorganization();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organization/Restaurant View"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ListTile(
          trailing: ElevatedButton(onPressed: (){},child: Text("Add New"),),
        ),
      ),
      body: GetBuilder<AppController>(

        builder: (app) {
          return ListView.builder(
              itemCount: app.lstorganization.length,
              itemBuilder: (context,index)=>ListTile(
                onTap: ()=>Get.to(()=>UsersByOrganization(app.lstorganization.elementAt(index))),
            title:Text(app.lstorganization.elementAt(index).organizationName!),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                subtitle: Text(app.lstorganization.elementAt(index).organizationaddress!),
          ));
        }
      ),
    );
  }
}
