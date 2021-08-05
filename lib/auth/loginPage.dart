import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/auth/loginController.dart';

import 'drawerPage.dart';

class LoginPage extends StatelessWidget {
  final logCont = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // logCont.userList();
    return Scaffold(

      appBar: AppBar(
        title: Text("Crud Application"),
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
              SizedBox(
                height: 20,
              ),
              showText(logCont.username.value, "User Name"),
              SizedBox(
                height: 20,
              ),
              showText(logCont.usermobile.value, "Mobile"),
              SizedBox(
                height: 20,
              ),
              showText(logCont.addressController.value, "Address"),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  // logCont.storeData();
                  // logCont.saveOrUpdate();
                  logCont.createUser();
                },
                child: Text("submit"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  // Get.to(HomeTwo());
                  // Get.to(ShowUserPage());
                },
                child: Text("go HomePage"),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 5,
                color: Colors.blue,
              ),
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
