import 'package:get/get.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../services/authentication_services.dart';
import 'verify_email_controller.dart';

class VerifyEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailController());
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationServices());
  }
}
