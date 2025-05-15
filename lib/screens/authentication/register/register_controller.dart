import 'package:get/get.dart';
import '../../../../../utils/app_exports.dart';
import '../../../data/preference_controller.dart';
import '../../../repositories/authentication_repositories.dart';
import '../../../utils/colorful_log.dart';
import '../../../utils/message_helper.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  final _repo = Get.find<AuthenticationRepository>();
  final _prefs = Get.find<PreferenceController>();
  late BuildContext pageContext;

  Future submitRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (await NetworkCheckerUtils.hasNetwork()) {
      isLoading.value = true;
      ApiResult result = await _repo.registration(
        name,
        phone,
        email,
        password,
        confirmPassword,
      );

      // ColorLog.devLog(result.response!.data!);

      if (result.response?.status == 200 || result.response?.status == 201) {
        if (result.response!.data!['success'] == 1) {
          if (!pageContext.mounted) return;
          MessageHelper.success(
            message: result.response!.data!['message'],
            context: pageContext,
          );
          isLoading.value = false;

          if (result.response!.data!['message']!.toString().trim().contains(
            'verify',
          )) {
            if (!pageContext.mounted) return;
            MessageHelper.success(
              message: result.response!.data!['message'].toString(),
              context: pageContext,
            );
            Get.toNamed(RouteNames.verifyEmail, arguments: email);
          } else {
            if (!pageContext.mounted) return;
            MessageHelper.success(
              message: result.response!.data!['message'].toString(),
              context: pageContext,
            );
          }
        } else if (result.response!.data!['success'] == 0) {
          if (!pageContext.mounted) return;
          MessageHelper.error(
            message:
                result.response!.data!['message'] ?? 'Something went wrong!',
            context: pageContext,
          );
          if (result.response!.data!['errors']!.isNotEmpty) {
            final errors = result.response?.data?['errors'];
            final emailError =
                (errors is List && errors.isNotEmpty && errors[0] is Map)
                    ? errors[0]['email']
                    : null;

            MessageHelper.error(
              message: emailError ?? 'Something went wrong!',
              context: pageContext,
            );
          }
          isLoading.value = false;
        }
      } else {
        if (!pageContext.mounted) return;
        MessageHelper.error(
          message: result.response!.data!['message'] ?? 'Something went wrong!',
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
