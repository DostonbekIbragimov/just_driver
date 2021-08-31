import 'package:get/get.dart';
import 'package:just_driver/bindings/login_binding.dart';
import 'package:just_driver/bindings/main_bindings.dart';
import 'package:just_driver/bindings/register_bindings.dart';
import 'package:just_driver/ui/auth/login/login.dart';
import 'package:just_driver/ui/auth/register/register.dart';
import 'package:just_driver/ui/main/dashboard/dashboard.dart';
import 'package:just_driver/ui/splash/splash.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
  ];
}
