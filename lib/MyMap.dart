import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:save_me_2/MyMapController.dart';

import 'helper.dart';

class MyMap extends StatefulWidget {
  // final String lat;
  // final String lng;

  // const MyMap({Key? key, required this.lat, required this.lng})
  //     : super(key: key);

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController mapController;
  // final mymapcont = Get.put(MyMapController());
  MyMapController mapcontroll = Get.find();
  String searchAddr;

  // double l= double.tryParse(${widget.lat});
  LatLng _center = const LatLng(45.521563, -122.677433);
  LatLng get initialPos => _center;
  bool buscando = false;
  double l;
  double d;
  List<Marker> myMarker=[];
  void onCameraMove(CameraPosition position) async {
    setState(() {});
    buscando = false;
    _center = position.target;
  }

  void onCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void getMoveCamera() async {
    // mymapcont.getpointerLocation();
    mapcontroll.getpointerLocation(_center.latitude, _center.longitude);
  }

  @override
  void initState() {
    _center = LatLng(mapcontroll.pointLat.value, mapcontroll.pointLong.value);
    myMarker=[];
    myMarker.add(
        Marker(markerId: MarkerId("help"),
          position: _center,
        )
    );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;
    }

    // l = double.tryParse(widget.lat);
    // d = double.tryParse(widget.lng);
    // _center = const LatLng(45.521563, -122.677433);
    // String s= widget.lat;
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Location'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 15.7),
            minMaxZoomPreference: MinMaxZoomPreference(11.5, 18.8),
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            onCameraMove: onCameraMove,
            onMapCreated: onCreated,
            markers: Set.from(myMarker),
            onCameraIdle: () async {
              buscando = true;
              setState(() {});
              getMoveCamera();
            },
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: showbottom(),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                height: 150,
                width: 150,
                padding: EdgeInsets.only(bottom: 50),
                child: Icon(
                  Icons.location_on,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }

  handleTap(LatLng tappedPoint){
    setState(() {
      myMarker=[];
      myMarker.add(
        Marker(markerId: MarkerId(tappedPoint.toString()),
        position: _center,
        )
      );
    });
  }
  Widget showbottom() {
    return Container(
      // width: 200,
      height: 100,

      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Stack(
        children: [
          Positioned(
            bottom: 30.0,
            right: 0.0,
            left: 0.0,
            child: Container(
                height: 50.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border:
                        Border.all(color: Color(Helper.getHexToInt("#F0F0F0"))),
                    color: Colors.white),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Color(Helper.getHexToInt("#E8E8E8"))),
                        child: Icon(Icons.star),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: Obx(
                          () => TextField(
                            decoration: InputDecoration(
                                hintText: mapcontroll.pointAddress.value,
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: searchandNavigate,
                                    iconSize: 30.0)),
                            onChanged: (val) {
                              setState(() {
                                searchAddr = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          // Positioned(
          //     bottom: 10.0,
          //     right: 10.0,
          //     left: 10.0,
          //     child: Container(
          //       height: 50.0,
          //       width: double.infinity,
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: InkWell(
          //               onTap: () {},
          //               child: Container(
          //                 height: 50,
          //                 // margin: EdgeInsets.all(10),
          //                 decoration: BoxDecoration(
          //                   gradient: LinearGradient(
          //                       begin: Alignment.topLeft,
          //                       colors: [
          //                         Color(Helper.getHexToInt("#11C7A1")),
          //                         // Colors.green[600],
          //                         Color(Helper.getHexToInt("#11E4A1"))
          //                       ]),
          //                   // color: Colors.white,
          //                   borderRadius: BorderRadius.circular(9),
          //                 ),
          //                 child: Center(
          //                     child: Text(
          //                   "Set Location",
          //                   style: TextStyle(
          //                     fontSize: 16,
          //                     color: Colors.white,
          //                     fontFamily: 'TTCommonsm',
          //                   ),
          //                 )),
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             width: 5,
          //           ),
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               alignment: Alignment.topLeft,
          //               // padding: EdgeInsets.only(top: 5, left: 5),
          //               width: 50,
          //               height: 50,
          //               decoration: BoxDecoration(
          //                   gradient: LinearGradient(
          //                       begin: Alignment.topLeft,
          //                       colors: [
          //                         Color(Helper.getHexToInt("#11C7A1")),
          //                         // Colors.green[600],
          //                         Color(Helper.getHexToInt("#11E4A1"))
          //                       ]),
          //                   borderRadius: BorderRadius.circular(9)),
          //               child: Center(child: Icon(Icons.star)),
          //             ),
          //           ),
          //         ],
          //       ),
          //     )),
        ],
      ),
    );
  }

  searchandNavigate() {
    print("search");
    if (searchAddr != null) {
      Geolocator().placemarkFromAddress(searchAddr).then((result) {
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                    result[0].position.latitude, result[0].position.longitude),
                zoom: 10.0)));
      });
    }
  }
}
