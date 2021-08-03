import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:save_me_2/MyMap.dart';

class MyMapController extends GetxController {
  var pointLat = 0.0.obs;
  var pointLong = 0.0.obs;
  var pointAddress = "".obs;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  gotoMap(var l, var ln) {
    pointLat.value = l;
    pointLong.value = ln;

    Get.to(MyMap());
  }

  getpointerLocation(double let, double lo) async {
    print("call api");

    await Future.delayed(Duration(seconds: 1));
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordi = new Coordinates(let, lo);
    // pointLat.value = let;
    // pointLong.value = lo;
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordi);

    print(addresses.length);
    var first = addresses.first;
    pointAddress.value = first.addressLine;
  }

  getLocation() async {
    await Future.delayed(Duration(seconds: 1));
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final coordinates = new Coordinates(position.latitude, position.longitude);
    pointLat.value = position.latitude;
    pointLong.value = position.longitude;
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var first = addresses.first;
    pointAddress.value = first.addressLine;
    // pointAddress(first.addressLine);

    print(pointAddress.value);
  }
}
