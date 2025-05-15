import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';

import '../../../utils/validation_schemas.dart';

import 'register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.find<RegisterController>();

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
          initialValues: {
            'name': '',
            'phone': '',
            'email': '',
            'password': '',
            'confirmPassword': '',
          },
          validationSchema: registerValidationSchema,
          onSubmit: (payload, errors) {
            if (errors.isEmpty) {
              controller.submitRegister(
                name: payload['name'],
                phone: payload['phone'],
                email: payload['email'],
                password: payload['password'],
                confirmPassword: payload['confirmPassword'],
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
                    hint: StaticStrings.name,
                    onChange: (value) => handleChange('name', value),
                    errorMessage: errors['name'],
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
                    tp: TextInputType.phone,
                    hint: StaticStrings.phone,
                    onChange: (value) => handleChange('phone', value),
                    errorMessage: errors['phone'],
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

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 70.w,
                  ),
                  child: CustomInput.appTextField(
                    hint: StaticStrings.confirmPassword,
                    onChange: (value) => handleChange('confirmPassword', value),
                    errorMessage: errors['confirmPassword'],
                    textInputAction: TextInputAction.next,
                    maxLength: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 45.w,
                  ).copyWith(top: 50.h, bottom: 25.h),
                  child: Obx(
                    () => Buttons.primaryBtn(
                      paddingHorizontal: 8,
                      isLoadingProgress: controller.isLoading.value,
                      context: context,
                      title: StaticStrings.register,
                      event: () => handleSubmit(),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RouteNames.login);
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
                        StaticStrings.alreadyHaveAccount,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.dimGrey,
                          fontFamily: CustomFonts.Poppins,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        StaticStrings.login,
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
    Get.delete<RegisterController>();
    super.dispose();
  }
}
