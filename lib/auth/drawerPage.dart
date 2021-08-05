import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/auth/loginController.dart';

class DrawerPage extends StatelessWidget {
  LoginController logctroll = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
                UserAccountsDrawerHeader(
                    // accountName: Text(logctroll.username.value.toString()),
                    accountEmail: Text(logctroll.curentUsermail.value),

                ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),

          InkWell(
            onTap: (){
              logctroll.logout();
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blueAccent,
              ),
              child: Center(
                child: Text("Logout",style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              )
            ),
          )


        ],

      ),
    );
  }
}
