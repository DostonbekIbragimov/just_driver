import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_driver/base/base_controller.dart';
import 'package:just_driver/core/theme/app_colors.dart';
import 'package:just_driver/data/models/auth/RegisterResponse.dart';
import 'package:just_driver/data/repository/auth/auth_repository.dart';
import 'package:just_driver/routes/app_routes.dart';

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
  XFile? _photoFile;

  // multi-part
  String phone = "";
  String firstName = "";
  String lastName = "";
  String gender = "male";
  String birthDate = "";
  String role = "driver";
  String addressName = "";

  final ImagePicker _picker = ImagePicker();

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
    firstName = value;
    update();
  }

  void onChangedTextSurname(String value) {
    _isEmptySurnameField = value.isEmpty;
    lastName = value;
    update();
  }

  void onChangedGender(int? value) {
    _selectedGender = value ?? 0;
    gender = _selectedGender == 0 ? "male" : "female";
    update();
  }

  void onChangedBirthDate(String? value) {
    _selectedBirthDate = value ?? "";
    _registerDateTimePickerController.text = _selectedBirthDate;
    update();
  }

  void getImage() async {
    final _photo = await _picker.pickImage(source: ImageSource.gallery);
    _photoFile = _photo;
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

  get photoFile => _photoFile;

  void register() async {
    setLoading(true);
    final result = await _repository.register(
        phone: Get.arguments,
        file: _photoFile,
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        role: 'driver',
        address: 'addressName',
        birthDate: _selectedBirthDate);
    if (result is RegisterResponse) {
      if (result.status == true) {
        Get.toNamed(Routes.CONFIRM, arguments: Get.arguments);
      } else {
        showError("Xatolik");
      }
    } else {
      showError(result);
    }
    setLoading(false);
  }
}
