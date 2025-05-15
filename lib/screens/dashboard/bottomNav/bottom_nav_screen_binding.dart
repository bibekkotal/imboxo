import 'package:get/get.dart';
import '../../../data/preference_controller.dart';
import '../../../repositories/home_repositories.dart';
import '../../../services/home_services.dart';
import 'bottom_nav_controller.dart';

class BottomNavScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => PreferenceController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut<HomeRepositories>(() => HomeServices());
  }
}
