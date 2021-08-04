import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save_me_2/Helper.dart';
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
            child: notificationCard(widget.lat, widget.lng, widget.titless)),

        //    InkWell(
        //       // onTap: (){},
        //       onTap: () {
        //         mymapcont.gotoMap();
        //       },
        //       child: notificationCard(widget.lat, widget.lng, widget.titless)),
        //   // child: Text("${widget.titless}, ${widget.lat}, ${widget.lng}")),
        // ),
      ),
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
                    l + ", " + d,
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
