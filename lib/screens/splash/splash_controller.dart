import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../utils/app_exports.dart';
import '../../data/preference_controller.dart';

class SplashController extends GetxController {
  SharedPreferences? _sharedPrefs;
  RxBool isLanguageSelected = false.obs;
  late BuildContext context;

  @override
  void onInit() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  Future<bool> changeLoginState(bool state) {
    return _sharedPrefs!.setBool(PreferenceController.loginStatusKey, state);
  }

  bool get loginStatus {
    return _sharedPrefs!.getBool(PreferenceController.loginStatusKey) ?? false;
  }

  @override
  void onReady() async {
    Future.delayed(const Duration(milliseconds: 800), () async {
      await goIntro();
    });

    super.onReady();
  }

  Future<void> goIntro() async {
    if (loginStatus) {
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      Get.offAllNamed(RouteNames.login);
    }
  }
}
