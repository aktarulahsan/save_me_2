import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:save_me_2/auth/signin.dart';

import 'package:save_me_2/message.dart';
import 'package:get/get.dart';

import 'auth/LoginBinding.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        initialBinding: LoginBinding(),
      home: SplashScreen()
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => LoginPage()));


      final FirebaseAuth auth = FirebaseAuth.instance;
      final User user = auth.currentUser;
      print("Device Token: ");

      if (user !=null) {
        Get.offAll(FirebaseMessagingDemo());
      } else {
        Get.offAll(SignIn());
      }


      // checkloginstutas();
    });
  }

  // void checkloginstutas() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // var email = prefs.getString('email');
  //   int islogin = prefs.getInt('islogin');
  //   print("islogin");
  //   print(islogin);
  //   if (islogin == null) {
  //     islogin = 0;
  //   }
  //   print(islogin);
  //   if (islogin == 1) {
  //     Get.offAll(HomePage());
  //   } else {
  //     Get.offAll(LoginPage());
  //   }
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 300.0,
                  child: Center(
                    child: Text(
                      "Help"
                    ),
                  ),
                  // child: Image.asset(
                  //   "assets/images/Enruta-Logo.png",
                  //   height: 100,
                  //   width: 150,
                  //   // fit: BoxFit.cover,
                  // ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
