import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<SplashController>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(const Duration(milliseconds: 100), () {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black45,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black45,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    });
    controller.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            AppImages.splashBg,
            height: mediaHeight,
            fit: BoxFit.fitWidth,
          ),
          Center(
            child: Image.asset(
              AppImages.logo,
              width: mediaWidth / 2.1,
              fit: BoxFit.contain,
            ).marginOnly(
              left: mediaWidth / 15,
              right: mediaWidth / 15,
              top: mediaHeight / 100,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }
}
