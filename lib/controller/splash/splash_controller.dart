import 'package:just_driver/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:just_driver/data/storage/storageUtil.dart';
import 'package:just_driver/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1500), () {
      StorageUtil.getInstance().then((value) async {
        bool hasProfile = StorageUtil.hasProfile();
        if (hasProfile)
          Get.offNamed(Routes.DASHBOARD);
        else
          Get.offNamed(Routes.LOGIN);
      });
      super.onInit();
    });
  }
}
