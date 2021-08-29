import 'package:get/get.dart';
import 'package:just_driver/controller/auth/login_controller.dart';

class LoginBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
