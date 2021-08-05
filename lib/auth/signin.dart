import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/auth/loginController.dart';
import 'package:save_me_2/auth/loginPage.dart';

import '../message.dart';

class SignIn extends StatelessWidget {
  final logCont = Get.put(LoginController());
  // LoginController logCont = Get.find();


  @override
  Widget build(BuildContext context) {
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

      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text("Sign In"),
      ),
      body: Container(
        // color: Colors.red,
        margin: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              showText(logCont.emailid.value, "Email"),
              SizedBox(
                height: 20,
              ),
              showText(logCont.pass.value, "password"),

              RaisedButton(
                onPressed: () {
                  // logCont.storeData();
                  // logCont.saveOrUpdate();
                  logCont.login();
                },
                child: Text("submit"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(LoginPage());
                  // Get.to(ShowUserPage());
                },
                child: Text("Create New Account"),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 5,
                color: Colors.blue,
              ),

            ],
          ),
        ),
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
          prefixIcon: Icon(Icons.verified_user)),
      controller: controller,
      onChanged: (value) {
        // print(value);
      },
    );
  }
}
