import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/route_manager.dart';
import 'package:velocity_x/velocity_x.dart';
class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  GlobalKey<FormState> frm = GlobalKey<FormState>();
  String errormsg="";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Widget signUpWith(IconData icon,String title) {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          TextButton(onPressed: () {}, child: Text(title)),
        ],
      ),
    );
  }
  Widget userInput(TextEditingController userInput, String hintTitle, TextInputType keyboardType,bool obscure) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 15, right: 25),
        child: TextFormField(
          validator: (v){
            if(v.isEmptyOrNull){
              return hintTitle + " should not be blank";
            }
            return null;
          },
          controller: userInput,
          autocorrect: false,
          enableSuggestions: false,
          autofocus: false,
          obscureText: obscure,
          decoration: InputDecoration.collapsed(
            hintText: hintTitle,
            hintStyle: TextStyle(fontSize: 18, color: Colors.black54, fontStyle: FontStyle.italic),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              alignment: Alignment.topCenter,

               fit: BoxFit.fitWidth,
              image: AssetImage(


                'assets/images/banner.png',

              ),
            ),

          // gradient: LinearGradient(colors: [
          //   Colors.teal,
          //   Colors.blueGrey
          // ]

          // )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 510,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo.shade100,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: frm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        "Xing Xing Log In".text.xl2.bold.black.make().centered(),
                        SizedBox(height: 25),
                        userInput(emailController, 'Email', TextInputType.emailAddress,false),
                        userInput(passwordController, 'Password', TextInputType.visiblePassword,true),
                        if(errormsg.length>0)
                          errormsg.text.red500.make().centered(),

                        Container(
                          height: 55,
                          // for an exact replicate, remove the padding.
                          // pour une réplique exact, enlever le padding.
                          padding: const EdgeInsets.only(top: 5, left: 70, right: 70),
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              primary: Colors.indigo.shade300,
                            ),
                            onPressed: ()async {
                                  Get.back();
                            },
                            child: Text('Log In', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(child: Text('Forgot password ?'),),
                        SizedBox(height: 20),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 25.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       signUpWith(MaterialCommunityIcons.google,"Google"),
                        //       signUpWith(MaterialCommunityIcons.facebook,"Facebook"),
                        //     ],
                        //   ),
                        // ),
                        Divider(thickness: 0, color: Colors.black12),
                        /*
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text('Don\'t have an account yet ? ', style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),),
                        TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      ],
                    ),
                      */
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
