import 'package:flutter/material.dart';
import 'package:just_driver/core/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? textSize;
  final bool? bold;

  CustomText({this.text, this.textSize, this.bold});

  @override
  Widget build(BuildContext context) {
    if (bold == true) {
      return Text(
        text!,
        style: TextStyle(
          fontSize: textSize ?? 20,
          fontFamily: "SpartanMB",
          fontWeight: FontWeight.bold,
          color: AppColors.textColor,
        ),
      );
    } else {
      return Text(
        text!,
        style: TextStyle(
          fontSize: textSize ?? 20,
          fontFamily: "SpartanMB",
          fontWeight: FontWeight.normal,
          color: AppColors.textColor,
        ),
      );
    }
  }
}
