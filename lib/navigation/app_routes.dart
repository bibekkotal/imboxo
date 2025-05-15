import '../screens/authentication/login/login_screen.dart';
import '../screens/authentication/login/login_screen_binding.dart';
import '../screens/authentication/register/register_screen.dart';
import '../screens/authentication/register/register_screen_binding.dart';
import '../screens/authentication/verifyEmail/verify_email_screen.dart';
import '../screens/authentication/verifyEmail/verify_email_screen_binding.dart';
import '../screens/dashboard/bottomNav/bottom_nav_screen.dart';
import '../screens/dashboard/bottomNav/bottom_nav_screen_binding.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/splash/splash_screen_binding.dart';
import '../utils/app_exports.dart';

class AppRoutes {
  AppRoutes._();

  static AppRoutes instance = AppRoutes._();

  static const Duration transitionDuration = Duration(milliseconds: 100);

  List<GetPage> routes() {
    return [
      GetPage(
        name: RouteNames.splash,
        page: () => const SplashScreen(),
        binding: SplashScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
      GetPage(
        name: RouteNames.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
      GetPage(
        name: RouteNames.register,
        page: () => const RegisterScreen(),
        binding: RegisterScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),
      GetPage(
        name: RouteNames.verifyEmail,
        page: () => const VerifyEmailScreen(),
        binding: VerifyEmailScreenBinding(),
        transition: Transition.fade,
        transitionDuration: transitionDuration,
      ),

      GetPage(
        name: RouteNames.dashboard,
        page: () => const BottomNavScreen(),
        binding: BottomNavScreenBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: transitionDuration,
      ),
    ];
  }
}
