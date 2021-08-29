import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  static Future getInstance() async {
    if (_storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  StorageUtil._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String getToken() {
    if (_preferences == null) return '';
    return _preferences!.getString('TOKEN') ?? '';
  }

  static Future setToken(String token) async {
    if (_preferences == null) return '';
    await _preferences!.setString('TOKEN', token);
  }

  static bool hasProfile() {
    if (_preferences == null) return false;
    return _preferences!.getBool('HasProfile') ?? false;
  }

  static Future yesProfile(bool value) async {
    if (_preferences == null) return false;
    await _preferences!.setBool("HasProfile", value);
  }

  static Future setLogOut(bool value) async {
    if (_preferences == null) return false;
    await _preferences!.setBool("LOG_OUT", value);
  }

  static bool getLogOut() {
    if (_preferences == null) return true;
    return _preferences!.getBool('LOG_OUT') ?? false;
  }
}
