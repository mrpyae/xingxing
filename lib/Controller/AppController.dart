import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:xingxing/Entity/GroupEntity.dart';
import 'package:xingxing/Entity/GroupItemEntity.dart';
import 'package:xingxing/Entity/GroupViewEntity.dart';
import 'package:xingxing/Entity/ItemEntity.dart';
import 'package:xingxing/Entity/OrganizationEntity.dart';
import 'package:xingxing/Entity/UserEntity.dart';
import 'package:xingxing/Util/AppConstants.dart';
class AppController extends GetxController{
  var lstitems = <ItemEntity>[].obs;
  var lstusers = <UserEntity>[].obs;
  var lstorganization = <OrganizationEntity>[].obs;
  var lstgroup = <GroupViewEntity>[].obs;



  Future<bool> getvaliditems()async{
    bool b = false;
    lstitems = <ItemEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
   var res= await http.post(Uri.parse(AppConstants().tablewareitemURL),body: {"getallvaliditems":"1"});
   if(res.statusCode== HttpStatus.ok){
     var jsonObject = (jsonDecode(res.body) as List).cast<
         Map<String, dynamic>>();
     var ue = jsonObject.map((e) =>  ItemEntity.fromJson(e)).toList();
     ue.forEach((element) {
       lstitems.add(element);
     });
      Get.back();
     update();
     b=true;
   }
    return b;
  }
  Future<bool> getAllItem()async{
    bool b = false;
    lstitems = <ItemEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
   var res= await http.post(Uri.parse(AppConstants().tablewareitemURL),body: {"getAllItem":"1"});
   if(res.statusCode== HttpStatus.ok){
     var jsonObject = (jsonDecode(res.body) as List).cast<
         Map<String, dynamic>>();
     var ue = jsonObject.map((e) =>  ItemEntity.fromJson(e)).toList();
     ue.forEach((element) {
       lstitems.add(element);
     });
      Get.back();
     update();
     b=true;
   }
    return b;
  }

  Future<bool> savegroupitem(GroupItemEntity gie)async{
    bool b = false;

    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
   var res= await http.post(Uri.parse(AppConstants().groupitemURL),body: jsonEncode(gie));
   if(res.statusCode== HttpStatus.created){

      Get.back();

     b=true;
   }
    return b;
  }
  Future<bool> deleteitem(String gid)async{
    bool b = false;

    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
   var res= await http.post(Uri.parse(AppConstants().groupitemURL),body: {"removeitem":gid});
   if(res.statusCode== HttpStatus.ok){

      Get.back();

     b=true;
   }
    return b;
  }

  Future<bool> getallusers()async{
    bool b = false;
    lstusers = <UserEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var res= await http.post(Uri.parse(AppConstants().userURL),body: {"getalluser":"1"});
    if(res.statusCode== HttpStatus.ok){
      var jsonObject = (jsonDecode(res.body) as List).cast<
          Map<String, dynamic>>();
      var ue = jsonObject.map((e) =>  UserEntity.fromJson(e)).toList();
      ue.forEach((element) {
        lstusers.add(element);
      });
      Get.back();
      update();
      b=true;
    }
    return b;
  }
  Future<bool> getuserbyorganization(String orgid)async{
    bool b = false;
    lstusers = <UserEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var res= await http.post(Uri.parse(AppConstants().userURL),body: {"organizationId":orgid});
    if(res.statusCode== HttpStatus.ok){
      var jsonObject = (jsonDecode(res.body) as List).cast<
          Map<String, dynamic>>();
      var ue = jsonObject.map((e) =>  UserEntity.fromJson(e)).toList();
      ue.forEach((element) {
        lstusers.add(element);
      });
      Get.back();
      update();
      b=true;
    }
    return b;
  }
  Future<bool> getAllorganization()async{
    bool b = false;
    lstorganization = <OrganizationEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var res= await http.post(Uri.parse(AppConstants().organizationURL),body: {"getallorganization":"1"});
    if(res.statusCode== HttpStatus.ok){
      var jsonObject = (jsonDecode(res.body) as List).cast<
          Map<String, dynamic>>();
      var ue = jsonObject.map((e) =>  OrganizationEntity.fromJson(e)).toList();
      ue.forEach((element) {
        lstorganization.add(element);
      });
      Get.back();
      update();
      b=true;
    }
    return b;
  }
  Future<bool> getallgroup()async{
    bool b = false;
    lstgroup = <GroupViewEntity>[].obs;
    Future.delayed(
        Duration.zero,
            () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var res= await http.post(Uri.parse(AppConstants().tablewaregroupURL),body: {"getallgroup":"1"});
    if(res.statusCode== HttpStatus.ok){
      var jsonObject = (jsonDecode(res.body) as List).cast<
          Map<String, dynamic>>();
      var ue = jsonObject.map((e) =>  GroupViewEntity.fromJson(e)).toList();
      ue.forEach((element) {
        lstgroup.add(element);
      });
      Get.back();
      update();
      b=true;
    }
    return b;
  }
}