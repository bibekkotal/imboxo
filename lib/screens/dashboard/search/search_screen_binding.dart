import 'package:get/get.dart';
import 'search_controller.dart';

class SearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenController());
  }
}
