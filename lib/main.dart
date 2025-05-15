import 'dart:ui' as ui;
import 'utils/app_exports.dart';
import 'utils/global_binding.dart';

void main() {
  RenderErrorBox.backgroundColor = Colors.black26;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.white);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Imboxo());
}

class Imboxo extends StatelessWidget {
  const Imboxo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: false,
      designSize: const Size(428, 926),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder:
          (BuildContext context, Widget? widget) => GetMaterialApp(
            initialBinding: GlobalBindings(),
            debugShowCheckedModeBanner: false,
            title: 'IMBOXO',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: false,
              typography: Typography.material2021(),
              splashFactory: InkRipple.splashFactory,
              splashColor: AppColors.primary.withOpacity(0.3),
              fontFamily: CustomFonts.Poppins,
            ),
            getPages: AppRoutes.instance.routes(),
            initialRoute: RouteNames.splash,
          ),
    );
  }
}
