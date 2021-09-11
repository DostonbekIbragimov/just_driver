import 'package:get/get.dart';
import 'package:just_driver/controller/auth/confirm_controller.dart';

class ConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmController());
  }
}
