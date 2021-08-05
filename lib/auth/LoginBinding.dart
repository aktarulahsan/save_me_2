// import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get.dart';
import 'loginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}