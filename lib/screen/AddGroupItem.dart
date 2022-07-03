import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xingxing/Controller/AppController.dart';
import 'package:xingxing/Entity/GroupItemEntity.dart';
import 'package:xingxing/Entity/GroupViewEntity.dart';
import 'package:xingxing/Entity/ItemEntity.dart';

class AddGroupItem extends StatefulWidget {
  GroupViewEntity gve;
   AddGroupItem(this.gve);

  @override
  State<AddGroupItem> createState() => _AddGroupItemState();
}

class _AddGroupItemState extends State<AddGroupItem> {
  AppController ac =Get.put(AppController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllvalidItem();
  }
  fetchAllvalidItem()async{
    bool b = await ac.getvaliditems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Items to " + this.widget.gve.tablewaregroupName!),
      ),
      body: GetBuilder<AppController>(


        builder: (app) {
          List<ItemEntity> ie = <ItemEntity>[];
          if(app.lstitems.length>0){
              app.lstitems.forEach((element) {
                  if(this.widget.gve.items!.length>0){
                  var ae =  this.widget.gve.items!.firstWhereOrNull((v) => v.itemId==element.itemId);
                  if(ae.isBlank as bool){
                    ie.add(element);
                  }
                  }else{
                    ie.add(element);
                  }
              });
          }



          return ListView.builder(
              itemCount: ie.length,
              itemBuilder: (context,index)=>Card(
                child: ListTile(
                  title: Text(ie.elementAt(index).itemname!),
                  subtitle: Text(ie.elementAt(index).unitprice!),
                  trailing: ElevatedButton(onPressed: (){

                    TextEditingController txtrentalprice = TextEditingController();
                    TextEditingController txtquantity  = TextEditingController();
                    GlobalKey<FormState> frmadditem= GlobalKey<FormState>();
                    GroupItemEntity gie = GroupItemEntity();
                    gie.tablewaregroupId=this.widget.gve.tablewaregroupId;
                    gie.itemId=ie.elementAt(index).itemId;
                      txtquantity.text="1";
                      txtrentalprice.text=ie.elementAt(index).unitprice!;
                    Get.defaultDialog(
                      title: "Add Item",
                      cancel: TextButton(onPressed: ()=>Get.back(), child: Text("Cancel")),
                      confirm: ElevatedButton(onPressed: ()async{
                        if(frmadditem.currentState!.validate()){
                          frmadditem.currentState!.save();
                       bool b = await  ac.savegroupitem(gie);
                       if(b){
                         await ac.getallgroup();
                         Get.back();
                         Get.back();
                       }

                        }
                      }, child: Text("Add & close")),
                      content: Container(
                        width: Get.width,height: Get.height/3,
                        child: SingleChildScrollView(
                          child: Form(
                            key: frmadditem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quantity"),
                                TextFormField(
                                  controller: txtquantity,
                                  validator: (v){
                                    if(v!.isEmpty){
                                      return "Quantity must fill";
                                    }
                                    return null;
                                  },
                                  onSaved: (v){
                                    gie.quantity=v;
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("Rental Price"),
                                TextFormField(
                                  controller: txtrentalprice,
                                  validator: (v){
                                    if(v!.isEmpty){
                                      return "Please fill Rental Price";
                                    }
                                    return null;
                                  },
                                  onSaved: (v){

                                    gie.rentalprice=v;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    );
                  },child: Text("Add"),),
                ),
              ));
        }
      ),
    );
  }
}
