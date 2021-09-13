import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget customButton(
    {required Function() function,
    required String text,
    Color? color,
    double? radius}) {
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: FlatButton(
      onPressed: function,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontFamily: "SpartanMB",
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      color: color ?? colorPrimary,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
      ),
    ),
  );
}

final maskFormatter = MaskTextInputFormatter(
    mask: ' ## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

Widget customMaskTextField({
  labelText,
  showError,
  controller,
  keyboardType,
  prefixText,
  errorText,
  inputAction,
  hintText,
  onChanged,
  currentFocus,
  nextFocus,
  context,
  filedFocus,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 24,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: RichText(
          text: TextSpan(
              style: TextStyle(
                color: colorPrimaryDark,
                fontFamily: "SpartanMB",
              ),
              children: [
                TextSpan(
                  text: labelText,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      fontFamily: "SpartanMB",
                      color: colorText),
                )
              ]),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      TextFormField(
        controller: controller,
        focusNode: currentFocus,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          fontFamily: "SpartanMB",
        ),
        inputFormatters: [maskFormatter],
        textInputAction: inputAction,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 7.2),
            child: Text(
              prefixText,
              style: TextStyle(
                  fontSize: 18.0,
                  color: colorBlack,
                  fontFamily: "SpartanMB",
                  fontWeight: FontWeight.normal),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 32.0,
            minHeight: 32.0,
            // maxHeight: 40.0,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary, width: 1),
            borderRadius: BorderRadius.circular(35),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(35),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          errorText: showError ?? false ? errorText : null,
        ),
        cursorColor: colorPrimary,
        keyboardType: keyboardType,
      ),
    ],
  );
}

Widget customTextField(
    {labelText,
    showError,
    controller,
    keyboardType,
    prefixText,
    errorText,
    inputAction,
    currentFocus,
    onChanged,
    hintText,
    nextFocus,
    context,
    filedFocus,
    onTap,
    isEmpty}) {
  return Focus(
    child: Builder(
      builder: (BuildContext context) {
        final FocusNode focusNode = Focus.of(context);
        final bool hasFocus = focusNode.hasFocus;
        return GestureDetector(
          onTap: () {
            if (hasFocus) {
              focusNode.unfocus();
            } else {
              focusNode.requestFocus();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                labelText,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: "SpartanMB",
                    color: AppColors.textColor),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: controller,
                focusNode: currentFocus,
                onTap: onTap,
                onFieldSubmitted: (term) {
                  filedFocus(context, currentFocus, nextFocus);
                },
                textInputAction: inputAction,
                onChanged: onChanged,
                decoration: InputDecoration(
                    filled: true,
                    hintText: hintText,
                    hintStyle:
                        TextStyle(fontSize: 14.0, fontFamily: "SpartanMB"),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    fillColor: hasFocus
                        ? Colors.white
                        : isEmpty
                            ? AppColors.grayColor
                            : Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorPrimary, width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: isEmpty ? AppColors.grayColor : colorPrimary,
                          width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorPrimary, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: showError ?? false ? errorText : null,
                    prefixText: prefixText),
                cursorColor: colorPrimary,
                keyboardType: keyboardType,
              ),
            ],
          ),
        );
      },
    ),
  );
}
