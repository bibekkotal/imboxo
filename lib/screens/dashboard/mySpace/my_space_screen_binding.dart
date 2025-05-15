import 'package:get/get.dart';
import 'my_space_controller.dart';

class MySpaceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MySpaceController());
  }
}
