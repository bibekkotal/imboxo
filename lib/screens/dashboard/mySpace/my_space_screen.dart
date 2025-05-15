import 'package:get/get.dart';
import '../../../utils/app_exports.dart';
import 'my_space_controller.dart';

class MySpaceScreen extends StatefulWidget {
  const MySpaceScreen({super.key});

  @override
  State<MySpaceScreen> createState() => _MySpaceScreenState();
}

class _MySpaceScreenState extends State<MySpaceScreen> {
  final MySpaceController controller = Get.put(MySpaceController());

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,

      ),
    );

    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: SingleChildScrollView(child: Text('Home'))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MySpaceController>();
    super.dispose();
  }
}
