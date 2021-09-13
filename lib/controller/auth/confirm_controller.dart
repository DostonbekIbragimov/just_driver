import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_driver/base/base_controller.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/models/auth/ConfirmRequest.dart';
import 'package:just_driver/data/models/auth/ConfirmResponse.dart';
import 'package:just_driver/data/repository/auth/auth_repository.dart';
import 'package:just_driver/data/storage/storageUtil.dart';
import 'package:just_driver/routes/app_routes.dart';

class ConfirmController extends BaseController {
  final _otpController = TextEditingController();
  Color _confirmButtonColor = AppColors.passive;
  final _repository = AuthRepository();

  get otpController => _otpController;

  void confirm() async {
    if (_confirmButtonColor == AppColors.passive) return;
    setLoading(true);
    final request =
        ConfirmRequest(phone: Get.arguments, code: _otpController.text);
    final result = await _repository.confirm(request: request);
    if (result is ConfirmResponse) {
      if (result.data != null) {
        StorageUtil.setToken(result.data!.auth_token!);
        StorageUtil.yesProfile(true);
        Get.offNamed(Routes.DASHBOARD);
      }
    } else {
      showError(result);
    }
    setLoading(false);
  }

  void onChanged(String value) {
    if (value.length == 6) {
      _confirmButtonColor = AppColors.active;
    } else {
      _confirmButtonColor = AppColors.passive;
    }
    update();
  }

  get confirmButtonColor => _confirmButtonColor;
}
