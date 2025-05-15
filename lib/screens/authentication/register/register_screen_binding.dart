import 'package:get/get.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../services/authentication_services.dart';
import 'register_controller.dart';

class RegisterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationServices());
  }
}
