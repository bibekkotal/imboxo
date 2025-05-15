import 'package:get/get.dart';
import '../../../../../utils/app_exports.dart';
import '../../../data/auth_response_model.dart';
import '../../../data/preference_controller.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../utils/colorful_log.dart';
import '../../../utils/message_helper.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final _repo = Get.find<AuthenticationRepository>();
  final _prefs = Get.find<PreferenceController>();
  late BuildContext pageContext;

  Future submitLogin({required String email, required String password}) async {
    if (await NetworkCheckerUtils.hasNetwork()) {
      isLoading.value = true;
      ApiResult result = await _repo.login(email, password);
      ColorLog.devLog(result.response!.data!);

      if (result.response?.status == 200 || result.response?.status == 201) {
        if (result.response!.data!['success'] == 1) {
          if (!pageContext.mounted) return;
          MessageHelper.success(
            message: result.response!.data!['message'],
            context: pageContext,
          );
          isLoading.value = false;
          LoginSuccessResponse loginSuccessResponse =
              LoginSuccessResponse.fromJson(result.response!.data!);

          if (loginSuccessResponse.success == 1) {
            _prefs.setAccessToken(loginSuccessResponse.token);
            _prefs.setUserId(loginSuccessResponse.data!.userId.toString());
            _prefs.changeLoginState(true);
            Get.offAllNamed(RouteNames.dashboard);
          }
        } else if (result.response!.data!['success'] == 0) {
          if (!pageContext.mounted) return;
          MessageHelper.error(
            message: result.response!.data!['message'].toString(),
            context: pageContext,
          );
          isLoading.value = false;
        }
      } else {
        if (result.response!.data!['message']!.toString().startsWith(
          'Please verify',
        )) {
          if (!pageContext.mounted) return;
          MessageHelper.success(
            message: result.response!.data!['message'].toString(),
            context: pageContext,
          );

          Get.toNamed(RouteNames.verifyEmail, arguments: email);
        } else {
          if (!pageContext.mounted) return;
          MessageHelper.error(
            message:
                result.response!.data!['message'] ?? 'Something went wrong!',
            context: pageContext,
          );
        }
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
