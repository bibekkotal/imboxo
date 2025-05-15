import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';

import '../../../utils/validation_schemas.dart';

import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.find<LoginController>();

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Formik(
          enableReinitialize: false,
          validateOnChange: true,
          initialValues: {'email': '', 'password': ''},
          validationSchema: loginValidationSchema,
          onSubmit: (payload, errors) {
            if (errors.isEmpty) {
              controller.submitLogin(
                email: payload['email'],
                password: payload['password'],
              );
            }
          },
          child: (
            Map<String, dynamic> values,
            bool? isValid,
            Function handleSubmit,
            Function handleReset,
            Function handleChange,
            Map<String, String> errors,
          ) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: mediaWidth / 2,
                  fit: BoxFit.contain,
                ).marginOnly(bottom: mediaHeight / 9, top: mediaHeight / 5.5),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 70.w,
                  ),
                  child: CustomInput.appTextField(
                    hint: StaticStrings.emailId,
                    onChange: (value) => handleChange('email', value),
                    errorMessage: errors['email'],
                    textInputAction: TextInputAction.next,
                    maxLength: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 70.w,
                  ),
                  child: CustomInput.appTextField(
                    hint: StaticStrings.yourPassword,
                    onChange: (value) => handleChange('password', value),
                    errorMessage: errors['password'],
                    textInputAction: TextInputAction.next,
                    maxLength: 30,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    foregroundColor: AppColors.white,
                  ),
                  child: Text(
                    StaticStrings.forgotPassword,
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
                  ).copyWith(top: 16.h, bottom: 25.h),
                  child: Obx(
                    () => Buttons.primaryBtn(
                      isLoadingProgress: controller.isLoading.value,
                      context: context,
                      title: StaticStrings.login,
                      event: () => handleSubmit(),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RouteNames.register);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    foregroundColor: AppColors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StaticStrings.haveAccount,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.dimGrey,
                          fontFamily: CustomFonts.Poppins,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        StaticStrings.register,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                          fontFamily: CustomFonts.Poppins,
                        ),
                        textAlign: TextAlign.left,
                      ).marginOnly(left: 5.w),
                    ],
                  ),
                ),
              ],
            ).marginOnly(bottom: mediaHeight / 6);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }
}
