import 'package:get/get.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../services/authentication_services.dart';
import 'login_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationServices());
  }
}
