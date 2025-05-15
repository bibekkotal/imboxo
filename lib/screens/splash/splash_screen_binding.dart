import 'package:get/get.dart';

import '../../data/preference_controller.dart';
import 'splash_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PreferenceController());
    Get.lazyPut(() => SplashController());
  }
}
