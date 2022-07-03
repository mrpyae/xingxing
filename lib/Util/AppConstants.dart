import 'package:flutter/material.dart';

class AppConstants{
  static String domain = "https://apps.iwahtee.com/xingxing/";
  String userURL = domain + "api/userapi.php";
  String tablewareitemURL = domain + "api/tablewareitemapi.php";
  String groupitemURL = domain + "api/groupitemapi.php";
  String organizationURL = domain + "api/organizationapi.php";
  String tablewaregroupURL = domain + "api/tablewaregroupapi.php";

 static Map<int, Color> cl =
  {
    50: Color.fromRGBO(123,134,198, .1),
    100:Color.fromRGBO(123,134,198, .2),
    200:Color.fromRGBO(123,134,198, .3),
    300:Color.fromRGBO(123,134,198, .4),
    400:Color.fromRGBO(123,134,198, .5),
    500:Color.fromRGBO(123,134,198, .6),
    600:Color.fromRGBO(123,134,198, .7),
    700:Color.fromRGBO(123,134,198, .8),
    800:Color.fromRGBO(123,134,198, .9),
    900:Color.fromRGBO(123,134,198, 1),
  };
  MaterialColor appColor = MaterialColor(0xFF7b86c6, cl);
}