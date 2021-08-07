import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/auth/signin.dart';
import 'package:save_me_2/auth/userModel.dart';
import 'package:save_me_2/message.dart';

import 'loginPage.dart';

class LoginController extends GetxController {
  final username = TextEditingController().obs;
  final usermobile = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final emailid = TextEditingController().obs;
  final pass = TextEditingController().obs;

  var userModel = UserModel().obs;

  final userList = List<UserModel>().obs;
  var curentUser= "".obs;
  var curentUsermail="".obs;
  var isUpdate = false.obs;
  var ptoken = "".obs;
  var user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  DatabaseReference _counterRef;
  FirebaseDatabase database;
  @override
  void onInit() {
    // TODO: implement onInit
    getCurentUser();
    // getUserlist();
    gettoken();
    checkUser();
    super.onInit();
  }
  void checkUser(){
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    // user = FirebaseAuth.instance.currentUser;
    print(user);
    print("user");
    if(user !=null){
      curentUser.value= user.uid; 
      curentUsermail.value= user.email;
      print(curentUsermail.value);
        // Get.to(FirebaseMessagingDemo());
    }
  }
  void saveOrUpdate() {
    isUpdate.value == false ? saveUser() : userUpdate();
  }

  void getCurentUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user);
  }

  void gettoken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
      ptoken.value = deviceToken;
    });
  }

  void sendpasswordresetemail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(SignIn());
      Get.snackbar("Password Reset email link is sent", "Successful!");
    }).catchError((onError) =>
        Get.snackbar("Error while trying to reset", onError.message));
  }

  void saveUser() async {
    UserModel model = new UserModel();
    model.name = username.value.text;
    model.mobile = usermobile.value.text;
    model.token = addressController.value.text;
    model.email = emailid.value.text;
    model.password = pass.value.text;
    // var a = await DatabaseHelper.insert(model);
    // print(a.toString());

      DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "name": model.name,
      "mobile": model.mobile,
      "token": ptoken.value,
    };
    ref.child('user').child(model.email).set(data).then((v) {});

    Get.to(SignIn());
    print(userList);
    reset();
  }

  void userUpdate() async {
    UserModel model = new UserModel();
    model.name = username.value.text;
    model.mobile = usermobile.value.text;
    model.token = addressController.value.text;
    model.email = emailid.value.text;
    model.password = pass.value.text;
    model.id = userModel.value.id;
    // var u = await DatabaseHelper.update(model);
    reset();
    // getUserlist();
  }

  // void getUserlist() async {
  //   List<Map<String, dynamic>> list = await DatabaseHelper.userList();

  //   userList.assignAll(list.map((e) => UserModel.fromJson(e)).toList());

  //   print(userList.toList());
  // }

  void deleteUser(UserModel user) async {
    // await DatabaseHelper.delete(user);
    // getUserlist();
  }

  void edituser(UserModel user) {
    reset();
    isUpdate.value = true;
    username.value.text = user.name;
    usermobile.value.text = user.mobile;
    addressController.value.text = user.token;
    emailid.value.text = user.email;
    pass.value.text = user.password;
    userModel.value = user;
    isUpdate.value = true;
  }

  void reset() {
    // this.isUpdate.value= false;
    emailid.value.text = "";
    pass.value.text = "";
    username.value.text = "";
    usermobile.value.text = "";
    addressController.value.text = "";
    isUpdate.value = false;
  }

  void createUser() async {
    _firebaseAuth = FirebaseAuth.instance;
    UserModel model = new UserModel();
    // model.name = username.value.text;
    // model.mobile = usermobile.value.text;
    // // model.address = addressController.value.text;
    model.email = emailid.value.text;
    model.password = pass.value.text;

    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: model.email, password: model.password,);
      // if(user.){}
      if (user != null) {
        print('reg sucess $user');
        saveUser();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar('worning', 'The account already exists for that email');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<UserModel> allData = [];

  void showUser() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('user').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      // print(data);
      print(keys);
      allData.clear();
      for (var key in keys) {
        UserModel d = new UserModel();

        d.name = data[key]['name'];
        d.mobile = data[key]['mobile'];
        d.token = data[key]['token'];

        allData.add(d);
      }
    });
  }

  void logout()async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.to(SignIn());
    } catch(e){
      print(e);
    }

  }
  void login()async{
    UserModel model = new UserModel();
    if(model.email ==""){
      Get.snackbar("warning", "please file the email field");
      return;
    }
    if(pass.value.text ==""){
      Get.snackbar("warning", "please file the password field");

      return;
    }
    model.email = emailid.value.text;
    model.password = pass.value.text;
    print(model.email);
    print(model.password);
    print(model.password);


    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: model.email,
          password: model.password
      );
      print(userCredential);
      print(userCredential.user.email);

      if(userCredential !=null){
        emailid.value.text = userCredential.user.email;

      }
      Get.to(FirebaseMessagingDemo());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("warning", "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("warning", "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    }

  }



}
