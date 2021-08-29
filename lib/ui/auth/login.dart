import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_driver/controller/auth/login_controller.dart';
import 'package:just_driver/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:just_driver/data/utils/widgets.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        child: Scaffold(
          backgroundColor: mainBackground,
          body: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "SpartanMB",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 40.0),
                    child: customMaskTextField(
                      prefixText: "+998",
                      labelText: "Enter telephone number",
                      controller: controller.loginController,
                      onChanged: controller.onChanged,
                      keyboardType: TextInputType.number,
                      inputAction: TextInputAction.done,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 35.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: customButton(
                        function: controller.login,
                        text: "Login",
                        color: controller.loginButtonColor,
                        radius: 35.0,
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
