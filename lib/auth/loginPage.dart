import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/Helper.dart';
import 'package:save_me_2/auth/loginController.dart';
import 'package:save_me_2/auth/signin.dart';

import 'drawerPage.dart';

class LoginPage extends StatelessWidget {
  final logCont = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // logCont.userList();
    final dw = MediaQuery.of(context).size.width / 100;
    final dh = MediaQuery.of(context).size.height / 100;

    return Scaffold(
       body:
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/backgroundUI.png"),
                fit: BoxFit.cover)),



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
                showText(logCont.username.value, "User Name"),
                SizedBox(
                  height: dh*2,
                ),
                showText(logCont.usermobile.value, "Mobile"),
                SizedBox(
                  height: dh*2,
                ),
                showText(logCont.addressController.value, "Address"),
                SizedBox(
                  height: dh*2,
                ),
                InkWell(
                  onTap: (){
                    logCont.createUser();
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
                        child: Text("Sign Up",style: TextStyle(
                          fontSize: dw * 4,
                          color: Colors.blue,
                        ),),
                      )),
                ),
                // RaisedButton(
                //   onPressed: () {
                //     // logCont.storeData();
                //     // logCont.saveOrUpdate();
                //     logCont.createUser();
                //   },
                //   child: Text("submit"),
                // ),
                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 20,
                ),
                // Divider(
                //   height: 5,
                //   color: Colors.blue,
                // ),
                // Obx(() => logCont.userList.length > 0
                //     ? ListView(
                //         shrinkWrap: true,
                //         physics: ClampingScrollPhysics(),
                //         children: List.generate(logCont.userList.length, (index) {
                //           return Container(
                //               child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                //             children: [
                //               Text(logCont.userList.value[index].name),
                //               SizedBox(
                //                 width: 10,
                //               ),
                //               Text(logCont.userList.value[index].mobile),
                //               SizedBox(
                //                 width: 10,
                //               ),
                //               Text(logCont.userList.value[index].address),
                //             ],
                //           ));
                //         }))
                //     : Text("ddd")),
                // Obx(
                //   () => logCont.userList.length > 0
                //       ? ListView.separated(
                //           scrollDirection: Axis.vertical,
                //           shrinkWrap: true,
                //           physics: ClampingScrollPhysics(),
                //           itemCount: logCont.userList?.length ?? 0,
                //           itemBuilder: (context, index) => Dismissible(
                //             child: UserListView(
                //               user: logCont.userList[index],
                //             ),
                //             key: UniqueKey(),
                //             onDismissed: (_) {
                //               var removed = logCont.userList[index];

                //               logCont.userList.removeAt(index);
                //               // logCont.deleteUser(logCont.userList[index]);

                //               Get.snackbar('Item removed',
                //                   ' Item   was successfully removed.');
                //             },
                //           ),
                //           // separatorBuilder: (_, __) => Divider(),
                //           separatorBuilder: (context, index) {
                //             return Text("");
                //           },
                //         )
                //       : Text(""),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) => SignIn()));
          Get.offAll(SignIn());
        },
        child: RichText(
            text: TextSpan(
              text: 'Have User?',
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' Sign In',
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
