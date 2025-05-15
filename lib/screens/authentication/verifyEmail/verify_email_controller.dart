import 'package:get/get.dart';
import '../../../../../utils/app_exports.dart';
import '../../../data/preference_controller.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../utils/colorful_log.dart';
import '../../../utils/message_helper.dart';

class VerifyEmailController extends GetxController {
  RxBool isLoading = false.obs;
  final _repo = Get.find<AuthenticationRepository>();
  final _prefs = Get.find<PreferenceController>();

  TextEditingController pinPutController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late BuildContext pageContext;

  Future<void> setEmail(String emailAddress) async {
    emailController.text = emailAddress;
  }

  Future verifyEmail() async {
    if (pinPutController.text.isEmpty || pinPutController.text.length < 6) {
      MessageHelper.error(
        message: StaticStrings.otpRequired,
        context: pageContext,
      );
    } else {
      if (await NetworkCheckerUtils.hasNetwork()) {
        isLoading.value = true;
        ApiResult result = await _repo.verifyEmail(
          emailController.text,
          pinPutController.text,
        );

        if (result.response?.status == 200 || result.response?.status == 201) {
          if (result.response!.data!['success'] == 1) {
            if (!pageContext.mounted) return;
            MessageHelper.success(
              message: result.response!.data!['message'],
              context: pageContext,
            );
            isLoading.value = false;
            Get.back();
          } else if (result.response!.data!['success'] == 0) {
            if (!pageContext.mounted) return;
            MessageHelper.error(
              message: result.response!.data!['message'].toString(),
              context: pageContext,
            );
            isLoading.value = false;
          }
        } else {
          if (!pageContext.mounted) return;
          MessageHelper.error(
            message:
                result.response!.data!['message'] ?? 'Something went wrong!',
            context: pageContext,
          );
          isLoading.value = false;
        }
      } else {
        MessageHelper.error(
          message: 'Internet connection error!',
          context: pageContext,
        );
      }
    }
  }
}
