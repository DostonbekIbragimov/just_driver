import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/utils/constants.dart';

Widget customTextDate({
  labelText,
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
  isEmpty,
  initialText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 16,
      ),
      Text(
        labelText,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: AppColors.textColor),
      ),
      SizedBox(
        height: 10,
      ),
      InkWell(
        onTap: onTap,
        child: TextFormField(
          controller: controller,
          focusNode: currentFocus,
          onTap: onTap,
          readOnly: true,
          onFieldSubmitted: (term) {
            filedFocus(context, currentFocus, nextFocus);
          },
          textInputAction: inputAction,
          onChanged: onChanged,
          decoration: InputDecoration(
              filled: true,
              suffixIcon: Icon(Icons.calendar_today_outlined),
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14.0, fontFamily: "SpartanMB"),
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              fillColor: isEmpty ? AppColors.grayColor : Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorPrimary, width: 1),
                borderRadius: BorderRadius.circular(6),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: isEmpty ? AppColors.grayColor : colorPrimary, width: 1),
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
      ),
    ],
  );
}
