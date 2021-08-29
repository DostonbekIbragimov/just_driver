import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget customButton(
    Function() function, String text, Color? color, double radius) {
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
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      color: color ?? colorPrimary,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
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
      RichText(
        text: TextSpan(
            style: TextStyle(
              color: colorPrimary,
            ),
            children: [
              TextSpan(
                text: labelText,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: colorPrimary),
              )
            ]),
      ),
      SizedBox(
        height: 4,
      ),
      TextFormField(
        controller: controller,
        focusNode: currentFocus,
        onChanged: onChanged,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        inputFormatters: [maskFormatter],
        textInputAction: inputAction,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 4.7),
            child: Text(
              prefixText,
              style: TextStyle(
                  fontSize: 18.0,
                  color: colorBlack,
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
