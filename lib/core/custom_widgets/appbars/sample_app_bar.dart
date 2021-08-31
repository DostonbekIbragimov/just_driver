import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_driver/core/custom_widgets/texts/custom_texts.dart';

class SampleAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final Widget? action;
  final Widget? leading;
  final double? elevation;

  const SampleAppBar(
      {Key? key,
      this.titleWidget,
      this.title,
      this.action,
      this.leading,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? CustomText(text: title, textSize: 20),
      centerTitle: true,
      leading: leading ?? SizedBox.shrink(),
      elevation: elevation ?? 0,
      actions: [action ?? SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
