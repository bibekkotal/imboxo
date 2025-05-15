import 'package:get/get.dart';
import '../../../repositories/home_repositories.dart';
import '../../../services/home_services.dart';
import 'home_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut<HomeRepositories>(() => HomeServices());
  }
}
