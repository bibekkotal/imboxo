import 'package:get/get.dart';
import 'collection_controller.dart';

class CollectionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectionController());
  }
}
