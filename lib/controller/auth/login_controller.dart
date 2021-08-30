import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_driver/base/base_controller.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/models/auth/LoginRequest.dart';
import 'package:just_driver/data/models/auth/LoginResponse.dart';
import 'package:just_driver/data/repository/auth/auth_repository.dart';
import 'package:just_driver/routes/app_routes.dart';

class LoginController extends BaseController {
  final _loginController = TextEditingController();
  final FocusNode _loginFocus = FocusNode();
  Color _loginButtonColor = AppColors.passive;
  final _repository = AuthRepository();

  void onChanged(String value) {
    if (value.length == 13) {
      _loginButtonColor = AppColors.active;
    } else {
      _loginButtonColor = AppColors.passive;
    }
    update();
  }

  void login() async {
    if (_loginButtonColor == AppColors.passive) return;
    setLoading(true);
    final request =
        LoginRequest(phone: "998${_loginController.text.replaceAll(" ", "")}");
    final result = await _repository.login(request: request);
    if (result is LoginResponse) {
      if (result.data?.exist ?? false) {
        Get.offNamed(Routes.DASHBOARD);
      } else {
        Get.offNamed(Routes.REGISTER);
      }
    } else {
      showError(result);
    }
    setLoading(false);
  }

  get loginController => _loginController;

  FocusNode get loginFocus => _loginFocus;

  Color get loginButtonColor => _loginButtonColor;
}
