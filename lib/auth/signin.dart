import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/Helper.dart';
import 'package:save_me_2/auth/loginController.dart';
import 'package:save_me_2/auth/loginPage.dart';

import '../message.dart';
import 'ForgotPassword.dart';

class SignIn extends StatelessWidget {
  final logCont = Get.put(LoginController());
  // LoginController logCont = Get.find();

  @override
  Widget build(BuildContext context) {
    final dw = MediaQuery.of(context).size.width / 100;
    final dh = MediaQuery.of(context).size.height / 100;
    // logCont.checkUser();
    // if(logCont.curentUser.value !=null){
    //   // Get.to(());
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => FirebaseMessagingDemo()),
    //   );
    // }

    // logCont.userList();
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Sign In"),
      // ),
      body: Container(
        // color: Colors.red,
        decoration: BoxDecoration(
            image: DecorationImage(
                  image: AssetImage("assets/backgroundUI.png"),
                fit: BoxFit.cover)),

        //
        child: Container(
          margin: EdgeInsets.all(dh * 4),
          child: Center(
            child: ListView(
              children: [
                Container(
                  height: dh*20,
                  width: dw*20,
                  margin: EdgeInsets.only(top: dh*5),
                  child: Image.asset('assets/logo2.png'),
                ),

                SizedBox(
                  height: dh*2,
                ),
                showText(logCont.emailid.value, "Email"),
                SizedBox(
                  height: dh*2,
                ),
                showText(logCont.pass.value, "password"),
                SizedBox(
                  height: dh*2,
                ),
                InkWell(
                  onTap: (){
                    logCont.login();
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
                        child: Text("Sign In",style: TextStyle(
                          fontSize: dw * 4,
                          color: Colors.black,
                        ),),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Text(
                    "Forgot Password ? Reset Now!",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: dh*2,
                ),
                // InkWell(
                //   onTap: (){
                //     Get.to(LoginPage());
                //   },
                //   child: Container(
                //       height: dh * 5,
                //       // margin: EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //         gradient:
                //         LinearGradient(begin: Alignment.topLeft, colors: [
                //           Color(Helper.getHexToInt("#11C7A1")),
                //           // Colors.green[600],
                //           Color(Helper.getHexToInt("#11E4A1"))
                //         ]),
                //         // color: Colors.white,
                //         borderRadius: BorderRadius.circular(dh * 2),
                //       ),
                //       child: Center(
                //
                //
                //         child: Text("Create New Account",style: TextStyle(
                //           fontSize: dw * 4,
                //           color: Colors.black,
                //         ),),
                //       )),
                // ),
                // RaisedButton(
                //   onPressed: () {
                //     // logCont.storeData();
                //     // logCont.saveOrUpdate();
                //     logCont.login();
                //   },
                //   child: Text(
                //     "submit",
                //     style: TextStyle(
                //       fontSize: dw * 4,
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                // RaisedButton(
                //   onPressed: () {
                //     Get.to(LoginPage());
                //     // Get.to(ShowUserPage());
                //   },
                //   child: Text("Create New Account"),
                // ),
                SizedBox(
                  height: 20,
                ),

                // Divider(
                //   height: 5,
                //   color: Colors.blue,
                // ),
              ],
            ),
          ),
        ),
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
        ),
    );
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
