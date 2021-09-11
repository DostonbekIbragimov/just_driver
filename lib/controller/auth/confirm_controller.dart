import 'package:flutter/material.dart';
import 'package:just_driver/base/base_controller.dart';

class ConfirmController extends BaseController {
  final _otpController = TextEditingController();

  get otpController => _otpController;
}
