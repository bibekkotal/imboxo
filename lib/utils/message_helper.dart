import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';
import 'app_exports.dart';

class MessageHelper {
  static void success({
    required String message,
    required BuildContext? context,
  }) {
    if (context == null) {
      return;
    }
    AnimatedSnackBar.removeAll();
    return AnimatedSnackBar(
      animationCurve: Curves.elasticOut,
      duration: const Duration(seconds: 3),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFF06803E),
            // border: Border.all(
            //   color: const Color(0xFFEF7A03),
            //   width: 0.05,
            // ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SizedBox(
            width: Get.width / 1.5,
            child: Text(
              message.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
        );
      }),
    ).show(context);
  }

  static void common({
    required String message,
    required BuildContext? context,
  }) {
    if (context == null) {
      return;
    }
    AnimatedSnackBar.removeAll();
    return AnimatedSnackBar(
      animationCurve: Curves.elasticOut,
      duration: const Duration(seconds: 3),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFCBCCCE),
            // border: Border.all(
            //   color: const Color(0xFFEF7A03),
            //   width: 0.05,
            // ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SizedBox(
            width: Get.width / 1.5,
            child: Text(
              message.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
        );
      }),
    ).show(context);
  }

  static void error({required String message, required BuildContext? context}) {
    if (context == null) {
      return;
    }

    AnimatedSnackBar.removeAll();

    return AnimatedSnackBar(
      animationCurve: Curves.easeOutBack,
      duration: const Duration(seconds: 3),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFE5554E),
            // border: Border.all(
            //   color: const Color(0xFFEF7A03),
            //   width: 0.05,
            // ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SizedBox(
            width: Get.width / 1.5,
            child: Text(
              message.toString(),
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
        );
      }),
    ).show(context);
  }

  static void internetConnected(BuildContext context) {
    return AnimatedSnackBar(
      animationCurve: Curves.easeOutBack,
      duration: const Duration(seconds: 3),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFCBCCCE),
            // border: Border.all(
            //   color: const Color(0xFFEF7A03),
            //   width: 0.05,
            // ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SizedBox(
            width: Get.width / 1.5,
            child: Text(
              'Connected to internet.',
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontFamily: CustomFonts.Poppins,
              ),
            ),
          ),
        );
      }),
    ).show(context);
  }

  static void noInternet(BuildContext context) {
    return AnimatedSnackBar(
      animationCurve: Curves.easeOutBack,
      duration: const Duration(seconds: 5),
      builder: ((context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFCBCCCE),
            // border: Border.all(
            //   color: const Color(0xFFEF7A03),
            //   width: 0.05,
            // ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: Get.width / 1.5,
                child: Text(
                  'Is internet working?',
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontFamily: CustomFonts.Poppins,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    ).show(context);
  }
}
