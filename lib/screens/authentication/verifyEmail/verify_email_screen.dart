import 'package:pinput/pinput.dart';

import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';

import '../../../utils/validation_schemas.dart';

import 'verify_email_controller.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final controller = Get.find<VerifyEmailController>();

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Object? mobileNumber = ModalRoute.of(context)!.settings.arguments;
    controller.setEmail(mobileNumber.toString());
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.logo,
              width: mediaWidth / 2,
              fit: BoxFit.contain,
            ).marginOnly(bottom: mediaHeight / 9, top: mediaHeight / 5.5),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 70.w),
              child: CustomInput.appTextField(
                controller: controller.emailController,
                hint: StaticStrings.emailId,
                onChange: () => {},
                errorMessage: '',
                textInputAction: TextInputAction.next,
                maxLength: 100,
                readOnly: true,
              ),
            ),

            Pinput(
              length: 6,
              controller: controller.pinPutController,
              pinAnimationType: PinAnimationType.scale,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              useNativeKeyboard: true,
              cursor: Container(width: 15, height: 1, color: AppColors.white),
              keyboardType: const TextInputType.numberWithOptions(),
              autofillHints: const [AutofillHints.oneTimeCode],
              defaultPinTheme: PinTheme(
                width: 45,
                height: 45,
                textStyle: TextStyle(
                  color: AppColors.white,
                  fontSize: 20.sp,
                  fontFamily: CustomFonts.Poppins,
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  controller.pinPutController.clear();
                }
              },
              hapticFeedbackType: HapticFeedbackType.vibrate,
            ).marginOnly(top: 15.h, bottom: 10.h, left: 20.w, right: 20.w),
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                foregroundColor: AppColors.white,
              ),
              child: Text(
                StaticStrings.resendOtp,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontFamily: CustomFonts.Poppins,
                ),
                textAlign: TextAlign.left,
              ),
            ).marginOnly(top: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45.w,
              ).copyWith(top: 15.h, bottom: 25.h),
              child: Obx(
                () => Buttons.primaryBtn(
                  paddingHorizontal: 8,
                  isLoadingProgress: controller.isLoading.value,
                  context: context,
                  title: StaticStrings.verify,
                  event: () {
                    controller.verifyEmail();
                  },
                ),
              ),
            ),
          ],
        ).marginOnly(bottom: mediaHeight / 6),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<VerifyEmailController>();
    super.dispose();
  }
}
