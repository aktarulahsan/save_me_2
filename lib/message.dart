import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:save_me_2/details_page.dart';

class FirebaseMessagingDemo extends StatefulWidget {
  FirebaseMessagingDemo() : super();
  final String title = 'Push Notification';

  @override
  State<StatefulWidget> createState() => _FirebaseMessagingDemoState();
}

class _FirebaseMessagingDemoState extends State<FirebaseMessagingDemo> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<Message> _messages;
  Letlng letlng;
  String lat;
  String lng;
  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token: $deviceToken");
    });
  }

  @override
  void initState() {
    super.initState();
    _messages = List<Message>();
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
        if (Platform.isAndroid) {
          sender = message['notification']['title'];
          parsedMessage = message['notification']['body'];
          lat = message['data']['Lat'];
          lng = message['data']['Lng'];
          print('sender: $lat');
          print('sender: $lng');
          print('parsedMessage: $parsedMessage');
          _setMessage(message);
        }
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
      var route = new MaterialPageRoute(
          builder: (BuildContext context) => DetailsPage(
                titless: title,
                lat: this.lat,
                lng: this.lng,
              ));
      Navigator.of(context).push(route);
    }

    setState(() {
      Message m = Message(title, body, message);
      _messages.add(m);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: null == _messages ? 0 : _messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                _messages[index].message,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Message {
  String title;
  String body;
  String message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}

class Letlng {
  String lat;
  String lng;
  Letlng(lat, lng) {
    this.lat = lat;
    this.lng = lng;
  }
}
