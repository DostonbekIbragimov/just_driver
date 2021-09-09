import 'package:flutter/material.dart';
import 'package:just_driver/base/base_controller.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/repository/auth/auth_repository.dart';

class RegisterController extends BaseController {
  final _registerNameController = TextEditingController();
  final _registerSurnameController = TextEditingController();
  final _registerDateTimePickerController = TextEditingController(text: "");

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _surnameFocus = FocusNode();
  final FocusNode _birthFocus = FocusNode();

  bool _isEmptyNameField = true;
  bool _isEmptySurnameField = true;
  int _selectedGender = 0;
  String _selectedBirthDate = "";

  Color _registerButtonColor = AppColors.passive;
  final _repository = AuthRepository();

  void onChangedButtonColor(String value) {
    if (value.length == 13) {
      _registerButtonColor = AppColors.active;
    } else {
      _registerButtonColor = AppColors.passive;
    }
    update();
  }

  void onChangedTextName(String value) {
    _isEmptyNameField = value.isEmpty;

    update();
  }

  void onChangedTextSurname(String value) {
    _isEmptySurnameField = value.isEmpty;
    update();
  }

  void onChangedGender(int? value) {
    _selectedGender = value ?? 0;
    update();
  }

  void onChangedBirthDate(String? value) {
    _selectedBirthDate = value ?? "";
    _registerDateTimePickerController.text = _selectedBirthDate;
    update();
  }

  bool get isEmptyNameField => _isEmptyNameField;

  bool get isEmptySurnameField => _isEmptySurnameField;

  get registerNameController => _registerNameController;

  get registerSurnameController => _registerSurnameController;

  get registerDateTimePickerController => _registerDateTimePickerController;

  get nameFocus => _nameFocus;

  get surnameFocus => _surnameFocus;

  get birthFocus => _birthFocus;

  int get selectedGender => _selectedGender;

  String get selectedBirthDate => _selectedBirthDate;

  Color get registerButtonColor => _registerButtonColor;

  void register() async {
    if (_registerButtonColor == AppColors.passive) return;
    setLoading(true);

    setLoading(false);
  }
}
