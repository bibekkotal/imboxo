import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceController extends GetxController {
  SharedPreferences? _preferences;

  static const _accessToken = "ACCESS_TOKEN";
  static const _userId = "USER_ID";
  static const loginStatusKey = "LOGIN_STATUS";

  @override
  void onInit() {
    super.onInit();
    initPreferences();
  }

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //----------------------------------------------------------------------------------------------

  Future<bool> setAccessToken(String token) {
    return _preferences!.setString(_accessToken, token);
  }

  String get accessTokens => _preferences!.getString(_accessToken) ?? "";

  Future<bool> setUserId(String userId) {
    return _preferences!.setString(_userId, userId);
  }

  String get userId => _preferences!.getString(_userId) ?? "";

  Future<bool> changeLoginState(bool state) {
    return _preferences!.setBool(loginStatusKey, state);
  }

  bool get loginStatus {
    return _preferences!.getBool(loginStatusKey) ?? false;
  }

  Future<void> clearAll() async {
    await _preferences?.clear();
  }
}
