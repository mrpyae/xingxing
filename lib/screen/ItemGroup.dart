import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:xingxing/Controller/AppController.dart';
import 'package:xingxing/Entity/GroupViewEntity.dart';
import 'package:xingxing/Util/AppConstants.dart';
import 'package:xingxing/screen/AddGroupItem.dart';

class ItemGroup extends StatefulWidget {
  const ItemGroup({Key? key}) : super(key: key);

  @override
  State<ItemGroup> createState() => _ItemGroupState();
}

class _ItemGroupState extends State<ItemGroup> {
  AppController ac =Get.put(AppController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchgroup();
  }
  fetchgroup()async{
    bool b = await ac.getallgroup();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TableWare Set"),
      ),
bottomNavigationBar: BottomAppBar(
  child: ListTile(
    trailing: ElevatedButton(onPressed: (){},child: Text("Create New Set"),),
  ),
),
body: GetBuilder<AppController>(

  builder: (app) {
    return     ListView.builder(
        itemCount: app.lstgroup.length,
        itemBuilder: (context,index)=>Card(
          elevation: 5.0,
          child: Column(
            children: [
              ListTile(
              title: Row(
                children: [
                  Container(width: 80,child: Text("Set Name",style: TextStyle(fontSize: 12,),),),
                Text(app.lstgroup.elementAt(index).tablewaregroupName!,style: TextStyle(
                  color: AppConstants().appColor[800],fontWeight: FontWeight.bold
                ),
                    ),

                ],
              ),
                trailing: Container(
                    color: Colors.black12,
                   width: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(app.lstgroup.elementAt(index).totalprice!),
                    )),
                subtitle: Container(
                  width: Get.width/2.2,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
                        onTap: (){
                          TextEditingController txtsetname = TextEditingController();
                          TextEditingController txttotal = TextEditingController();
                          GroupViewEntity gve =app.lstgroup.elementAt(index);
                          txtsetname.text= gve.tablewaregroupName!;
                          txttotal.text=gve.totalprice!;
                          GroupViewEntity ge = GroupViewEntity();
                          ge.tablewaregroupId=gve.tablewaregroupId;
                          GlobalKey<FormState> frmgroup = GlobalKey<FormState>();
                        Get.defaultDialog(title: "Edit Set Name",
                        content: Container(
                          height: Get.height/2,
                          child: SingleChildScrollView(
                            child: Form(
                              key: frmgroup,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Set Name"),
                                  TextFormField(controller: txtsetname,
                                    validator: (v){
                                    if(v!.isEmpty){
                                      return "Please Fill Set Name";
                                    }
                                    return null;
                                    },
                                    onSaved: (v){
                                        ge.tablewaregroupName=v;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                      border: OutlineInputBorder()
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Text("Set Total Price"),
                                  TextFormField(controller: txttotal,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        ,cancel: TextButton(onPressed: ()=>Get.back(), child: Text("Cancel"))
                            ,
                            confirm: ElevatedButton(onPressed: (){


                            },child: Text("Update"))
                        );
                       },
                        child: Row(
                          children: [
                           Icon(Icons.edit),
                            SizedBox(width: 5,),
                            Text("Edit"),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: ()=>Get.to(AddGroupItem(app.lstgroup.elementAt(index))),
                        child: Row(children: [
                          Icon(Icons.add_circle),
                          SizedBox(width: 5,),
                          Text("Add Item"),
                        ],),
                      ),
                      Checkbox(value: app.lstgroup.elementAt(index).tablewaregroupStatus=="1"?true:false, onChanged: (v){}),
                      Text("Enable"),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              app.lstgroup.elementAt(index).items!.length>0? ExpansionTile(title: Text("Sub Items"),children:
                app.lstgroup.elementAt(index).items!.map((e) => ListTile(
                  title: Text(e.itemname!),
                  leading: IconButton(onPressed: ()async{
                    bool b = await ac.deleteitem(e.itemgroupId!);
                    if(b){
                      fetchgroup();
                    }
                  },icon: Icon(Icons.delete,color: Colors.red,),),
                  trailing: Text(e.quantity! + " x " +e.rentalprice!),
                )).toList()
                ,):SizedBox.shrink()
            ],
          ),
        ));
  }
),
    );
  }
}
