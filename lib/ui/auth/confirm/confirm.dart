import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:just_driver/controller/auth/confirm_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/core/custom_widgets/texts/custom_texts.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ConfirmPage extends GetView<ConfirmController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfirmController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                            child: CustomText(
                              text: 'Successful, Enter the code that We sent to this ${Get.arguments} number',
                            ),
                          ),
                          SizedBox(height: 100,),
                          PinCodeTextField(
                            controller: controller.otpController,
                            autofocus: true,
                            maxLength: 6,
                            hideCharacter: false,
                            highlight: true,
                            highlightColor: colorPrimary,
                            defaultBorderColor: AppColors.grayColor,
                            hasTextBorderColor: colorPrimary,
                            pinBoxRadius: 8.0,
                            pinBoxColor: Colors.white,
                            highlightPinBoxColor: Colors.white,
                            wrapAlignment: WrapAlignment.center,
                            pinBoxWidth: 40.0,
                            pinBoxHeight: 44.0,
                            pinTextStyle: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24.0),
                            pinTextAnimatedSwitcherTransition: ProvidedPinBoxTextAnimation.scalingTransition,
                            pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 100),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
