import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';
import 'package:just_driver/controller/auth/register_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/core/custom_widgets/texts/custom_texts.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:just_driver/data/utils/widgets.dart';
import 'package:just_driver/ui/auth/login/widgets/login_widgets.dart';

class RegisterPage extends GetView<RegisterController> {
  static final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          backgroundColor: mainBackground,
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(children: [
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: CustomText(text: "Register", textSize: 24, bold: true),
                          ),
                          InkWell(
                            onTap: () {
                              _showSelectionDialog(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: ClipOval(
                                      child: controller.photoFile != null
                                          ? Image.file(
                                              File(controller.photoFile!.path),
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            )
                                          : SvgPicture.asset('assets/svg/add_photo.svg'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: CustomText(text: 'Add photo'),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: customTextField(
                                controller: controller.registerNameController,
                                keyboardType: TextInputType.name,
                                labelText: 'Name',
                                hintText: 'Enter Name',
                                currentFocus: controller.nameFocus,
                                nextFocus: controller.surnameFocus,
                                onChanged: controller.onChangedTextName,
                                isEmpty: controller.isEmptyNameField),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: customTextField(
                                controller: controller.registerSurnameController,
                                keyboardType: TextInputType.name,
                                labelText: 'Surname',
                                hintText: 'Enter Surname',
                                currentFocus: controller.surnameFocus,
                                nextFocus: controller.birthFocus,
                                onChanged: controller.onChangedTextSurname,
                                isEmpty: controller.isEmptySurnameField),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(text: 'Gender', bold: true, textSize: 13.0),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  controller.onChangedGender(0);
                                                },
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: SvgPicture.asset(
                                                        controller.selectedGender == 0 ? 'assets/svg/radio_checked.svg' : 'assets/svg/radio_unchecked.svg'))),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: InkWell(
                                                  onTap: () {
                                                    controller.onChangedGender(0);
                                                  },
                                                  child: CustomText(text: 'Male')),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  controller.onChangedGender(1);
                                                },
                                                child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: SvgPicture.asset(
                                                        controller.selectedGender == 1 ? 'assets/svg/radio_checked.svg' : 'assets/svg/radio_unchecked.svg'))),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: InkWell(
                                                  onTap: () {
                                                    controller.onChangedGender(1);
                                                  },
                                                  child: CustomText(text: 'Female')),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: customTextDate(
                              labelText: 'Birth date',
                              hintText: 'Select birth date',
                              controller: controller.registerDateTimePickerController,
                              onChanged: controller.onChangedBirthDate,
                              initialText: controller.selectedBirthDate,
                              isEmpty: controller.selectedBirthDate.isEmpty,
                              onTap: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(1900, 1, 1),
                                    maxTime: now,
                                    theme: DatePickerTheme(
                                      itemStyle: TextStyle(color: AppColors.textColor, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: "Spartan-MB"),
                                      doneStyle: TextStyle(color: AppColors.textColor, fontSize: 16, fontFamily: "Spartan-MB"),
                                    ), onChanged: (date) {
                                  controller.onChangedBirthDate(date.toString().substring(0, 10));
                                }, onConfirm: (date) {
                                  controller.onChangedBirthDate(date.toString().substring(0, 10));
                                },
                                    currentTime: controller.selectedBirthDate.isEmpty ? DateTime.now() : DateFormat("yyyy-MM-dd").parse(controller.selectedBirthDate),
                                    locale: LocaleType.en);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 35.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: customButton(
                                function: controller.register,
                                text: 'Register',
                                color: controller.registerButtonColor,
                                radius: 35.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Align(alignment: Alignment.center, child: Text("From where do you want to take the photo?")),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/png/camera.png',
                          height: 60,
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CustomText(
                            text: 'Camera',
                          ),
                        )
                      ],
                    ),
                    onTap: () async {
                      controller.getImage();

                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/png/gallery.png',
                          height: 68,
                          width: 68,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CustomText(
                            text: 'Gallery',
                          ),
                        )
                      ],
                    ),
                    onTap: () async {
                      controller.getImage();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
