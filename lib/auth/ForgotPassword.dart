import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_me_2/Helper.dart';
import 'package:save_me_2/auth/loginController.dart';
import 'package:get/get.dart';
import 'package:save_me_2/auth/loginPage.dart';

class ForgotPassword extends GetWidget<LoginController> {
  TextEditingController emailc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dw = MediaQuery.of(context).size.width / 100;
    final dh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
        body: SafeArea(

          child:Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgroundUI.png"),
                    fit: BoxFit.cover),
              ),
      child: ListView(
          children: [

          Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/logo2.png'),),
              // child: SvgPicture.asset("assets/logo.svg")),
              SizedBox(
                  height:  20.0),
              Text("Reset Password",style:   TextStyle(fontSize: 20.0, color: Colors.white)),
              // text.color(Colors.white).size(20).make(),)
              SizedBox(
                  height:  30.0),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              //
              //   child:
              showText(emailc, "Email"),
              // TextField(
              //   controller: email,
              //   decoration: InputDecoration(
              //     hintText: 'Email',
              //     hintStyle: TextStyle(color: Colors.white),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(10.0),
              //       borderSide: BorderSide(color: Colors.white),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //         borderRadius: new BorderRadius.circular(10.0),
              //         borderSide: BorderSide(color: Colors.blue[400])),
              //     isDense: true, // Added this
              //     contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              //   ),
              //   cursorColor: Colors.white,
              //   style: TextStyle(color: Colors.white),
              // ),
              // ),
              SizedBox(
                  height:  20.0),
              InkWell(
                onTap: (){
                  controller.sendpasswordresetemail(emailc.text);
                },
                child: Container(
                    height: dh * 5,
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient:
                      LinearGradient(begin: Alignment.topLeft, colors: [
                        Color(Helper.getHexToInt("#11C7A1")),
                        // Colors.green[600],
                        Color(Helper.getHexToInt("#11E4A1"))
                      ]),
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(dh * 2),
                    ),
                    child: Center(


                      child: Text("Reset Password",style: TextStyle(
                        fontSize: dw * 4,
                        color: Colors.black,
                      ),),
                    )),
              ),
              GestureDetector(
                  onTap: () {
                    controller.sendpasswordresetemail(emailc.text);
                  },
                  child:Text("Reset Password",style:   TextStyle(
                      height: 40, fontSize: 20.0, color: Color(0XFFFF0772)))),


            ],
          ),
        )
      ],
    ),
          )


        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => LoginPage()));
            Get.offAll(LoginPage());
          },
          child: RichText(
              text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )),
        ));
  }
  Widget showText(TextEditingController controller, var a) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          hintText: a,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.blue[400])),
          isDense: true, // Added this
          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          prefixIcon: Icon(Icons.verified_user)),
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      onChanged: (value) {
        // print(value);
      },
    );
  }
}
