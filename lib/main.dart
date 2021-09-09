import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/routes/app_pages.dart';
import 'package:just_driver/routes/app_routes.dart';
import 'package:just_driver/translations/app_translations.dart';
import 'package:just_driver/ui/splash/splash.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'bindings/main_bindings.dart';
import 'core/theme/app_theme.dart';
import 'data/network/api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        // Color for Android
        statusBarBrightness: Brightness.dark,
        // Dark == white status bar -- for IOS.
       /* systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.dividerColor,*/
      ),
    );
    return KeyboardDismisser(
      gestures: [GestureType.onTap],
      child: GetMaterialApp(
        navigatorKey: ApiClient.alice.getNavigatorKey(),
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        locale: Locale('ru'),
        initialBinding: MainBindings(),
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        transitionDuration: Duration(milliseconds: 100),
        home: SplashPage(),
      ),
    );
  }
}
