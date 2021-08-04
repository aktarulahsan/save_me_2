
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/MyMapController.dart';

class DetailsPage extends StatefulWidget {
  final String titless;
  final String lat;
  final String lng;

  const DetailsPage({Key key, this.titless, this.lat, this.lng})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final mymapcont = Get.put(MyMapController());

  @override
  Widget build(BuildContext context) {
    // MyMapController mapcontroll = Get.find();
    // log('mydata: $this.titless');
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Container(
        child: Center(
          child: InkWell(
            // onTap: (){},
              onTap:(){
                mymapcont.gotoMap();
              },
              child: Text("${widget.titless}, ${widget.lat}, ${widget.lng}")),
        ),
      ),
    );
  }
}
