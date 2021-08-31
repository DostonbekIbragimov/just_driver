import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? textSize;

  CustomText({this.text, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        style: TextStyle(
          fontSize: textSize!,
          fontFamily: "SpartanMB",
        ));
  }
}
