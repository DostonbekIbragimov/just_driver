import 'package:get/get.dart';
import 'package:just_driver/controller/main/dashboard_controller.dart';
import 'package:just_driver/controller/splash/splash_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => DashboardController());
  }
}
