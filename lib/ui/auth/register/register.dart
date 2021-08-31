import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:just_driver/controller/auth/register_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/core/custom_widgets/texts/custom_texts.dart';
import 'package:just_driver/data/utils/constants.dart';

class RegisterPage extends GetView<RegisterController> {
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
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 20),
                    child: CustomText(
                      text: "Register",
                      textSize: 24,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 50),
                    child: InkWell(
                      child: SvgPicture.asset('assets/svg/profile_picture.svg'),
                    ),
                  )
                ]),
              ),
            )),
      ),
    );
  }
}
