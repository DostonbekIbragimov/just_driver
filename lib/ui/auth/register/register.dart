import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:just_driver/controller/auth/register_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/data/utils/constants.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => ModalProgressHUD(
        child: Scaffold(
          backgroundColor: mainBackground,
          body: SafeArea(
            child: Stack(

            ),
          ),
        ),
      ),
    );
  }
}
