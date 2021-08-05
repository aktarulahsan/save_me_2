import 'dart:convert';
import 'dart:developer';

// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/Helper.dart';
import 'package:save_me_2/MyMapController.dart';
import 'package:save_me_2/auth/drawerPage.dart';

class FirebaseMessagingDemo extends StatefulWidget {
  FirebaseMessagingDemo() : super();
  final String title = 'Push Notification';

  @override
  State<StatefulWidget> createState() => _FirebaseMessagingDemoState();
}

class _FirebaseMessagingDemoState extends State<FirebaseMessagingDemo> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final mymapcont = Get.put(MyMapController());
  // List<Message> _messages;
  // late Letlng letlng;
  var lat;
  var lng;
  var titles = "a";
  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
    });
  }

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    // _messages = <Message>[].obs;
    _getToken();
    _configureFirebaseListeners();
  }

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        String sender;
        String parsedMessage;

        print('on message ${json.encode(message['data']['title'])}');
        print('onMessage: $message');
        // print('parsedMessage: $message');
        sender = message['notification']['title'];
        titles = message['notification']['title'];
        parsedMessage = message['notification']['body'];
        // print('parsedMessage: $message');
        lat = message['data']['Lat'];
        // lat = double.parse(lat);
        lng = message['data']['Lng'];
        // lng = double.parse(lng);
        mymapcont.pointLat.value = double.tryParse(lat);
        mymapcont.pointLong.value = double.tryParse(lng);
        print('lat: ${mymapcont.pointLat.value}');
        print('lng: ${mymapcont.pointLong.value}');
        print('parsedMessage: $parsedMessage');
        // mymapcont.gotoMap();
        _setMessage(message);
        // _setMessage(message);
        // if (Platform.isAndroid) {
        //   sender = message['notification']['title'];
        //   parsedMessage = message['notification']['body'];
        //   lat = message['data']['Lat'];
        //   lng = message['data']['Lng'];
        //   print('sender: $lat');
        //   print('sender: $lng');
        //   print('parsedMessage: $parsedMessage');
        //   _setMessage(message);
        // }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true, badge: true, alert: true),
    );
  }

  _setMessage(Map<String, dynamic> message) {
    final notification = message['notification'];
    final data = message['data'];
    final String title = notification['title'];
    final String body = notification['body'];
    final String mMessage = data['data'];
    print("Title: $title, body: $body, message: $mMessage");
    log('mydata: $title');

    if (title != null) {
      // var route = new MaterialPageRoute(
      //     builder: (BuildContext context) => DetailsPage(
      //           titless: title,
      //           lat: this.lat,
      //           lng: this.lng,
      //         ));
      // Navigator.of(context).push(route);
      setState(() {
        this.titles = title;
      });
    }

    // setState(() {
    //   Message m = Message(title, body, message);
    //   _messages.add(m);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: this.titles != "a"
              ? notificationCard(this.lat, this.lng, this.titles)
              : Text('location'),
        )

        // ListView.builder(
        //   itemCount: null == _messages ? 0 : _messages.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Card(
        //       child: Padding(
        //         padding: EdgeInsets.all(15.0),
        //         child: Text(
        //           _messages[index].message,
        //           style: TextStyle(
        //             fontSize: 16.0,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        );
  }

  Widget notificationCard(var l, var d, var t) {
    return Container(
      height: 66,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          print("object");

          // var a = t;
          // print(a);
          // var b = l;
          // var c = d;
          mymapcont.gotoMap();
          // controller.setAddress(a, b, c);
        },
        child: Stack(
          children: [
            Positioned(
              top: 16,
              left: 10,
              child: Container(
                height: 35,
                width: 35,
                child: CircleAvatar(
                  backgroundColor: Color(Helper.getHexToInt("#CDFFEF")),
                  radius: 60.0,
                  child: Container(
                      child: Icon(
                    Icons.location_on,
                    size: 18,
                    color: Color(Helper.getHexToInt("#11C4A1")),
                  )),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 65,
              child: Center(
                child: Container(
                  child: Text(
                    t,
                    style: TextStyle(
                        fontFamily: "TTCommonsd",
                        fontSize: 16,
                        color: Color(Helper.getHexToInt("#000000"))),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 38,
                left: 65,
                child: Center(
                  child: Text(
                    "latitude: " + l + ", " + "Longitude: " + d,
                    style: TextStyle(
                        fontFamily: "TTCommonsd",
                        fontSize: 14,
                        color: Color(Helper.getHexToInt("#9F9F9F"))),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// class Message {
//   String title;
//   String body;
//   String message;
//   Message(title, body, message) {
//     this.title = title;
//     this.body = body;
//     this.message = message;
//   }
// }

// class Letlng {
//   String lat;
//   String lng;
//   Letlng(lat, lng) {
//     this.lat = lat;
//     this.lng = lng;
//   }
// }
