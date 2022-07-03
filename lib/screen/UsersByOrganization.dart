import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xingxing/Controller/AppController.dart';
import 'package:xingxing/Entity/OrganizationEntity.dart';

class UsersByOrganization extends StatefulWidget {
  OrganizationEntity org;
   UsersByOrganization(this.org);

  @override
  State<UsersByOrganization> createState() => _UsersByOrganizationState();
}

class _UsersByOrganizationState extends State<UsersByOrganization> {
  AppController ac = Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchorgbyuser();
  }
  fetchorgbyuser()async{
    bool b =await ac.getuserbyorganization(this.widget.org.organizationId!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users From " + this.widget.org.organizationName!),
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
                elevation: 5.0,
                child: CheckboxListTile(value: app.lstusers.elementAt(index).userStatus=="1"?true:false, onChanged: (v){},
                title: Text(app.lstusers.elementAt(index).userName!),
                  subtitle: Text(app.lstusers.elementAt(index).loginId!),
                  secondary: IconButton(onPressed: (){},icon: Icon(Icons.edit),),
                ),
              ));
        }
      ),
    );
  }
}
