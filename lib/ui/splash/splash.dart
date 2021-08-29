import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_driver/data/storage/storageUtil.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:just_driver/ui/auth/login.dart';
import 'package:just_driver/ui/main/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    openNextPage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      body: Center(
        child: SvgPicture.asset(
          'assets/svg/just.svg',
          height: 80,
          width: 120,
        ),
      ),
    );
  }

  Future<Timer> openNextPage(BuildContext context) async {
    return Timer(Duration(milliseconds: 1500), () async {
      StorageUtil.getInstance().then((value) async {
        await StorageUtil.setLogOut(false);
        bool hasProfile = StorageUtil.hasProfile();
        if (hasProfile) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DashboardPage()));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }
      });
    });
  }
}
