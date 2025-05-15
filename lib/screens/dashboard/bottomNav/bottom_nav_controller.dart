import 'package:get/get.dart';
import '../../../../../utils/app_exports.dart';
import '../../../data/preference_controller.dart';
import '../collection/collection_screen.dart';
import '../collection/collection_screen_binding.dart';
import '../home/home_screen.dart';
import '../home/home_screen_binding.dart';
import '../mySpace/my_space_screen.dart';
import '../mySpace/my_space_screen_binding.dart';
import '../search/search_screen.dart';
import '../search/search_screen_binding.dart';

class BottomNavController extends GetxController {
  final _prefs = Get.find<PreferenceController>();
  RxInt currentPage = 0.obs;
  late BuildContext context;

  final List<NavItem> navItems = [
    NavItem(icon: AppImages.homeIcon, title: 'Home'),
    NavItem(icon: AppImages.collectionsIcon, title: 'Collections'),
    NavItem(icon: AppImages.searchIcon, title: 'Search'),
    NavItem(icon: AppImages.mySpace, title: 'My Space'),
  ];

  List<Widget> get screens {
    List<Widget> screenList = [
      const HomeScreen(),
      const CollectionScreen(),
      const SearchScreen(),
      const MySpaceScreen(),
    ];
    return screenList;
  }

  Map<int, Bindings> get pageBindings {
    Map<int, Bindings> bindings = {
      0: HomeScreenBinding(),
      1: CollectionScreenBinding(),
      2: SearchScreenBinding(),
      3: MySpaceScreenBinding(),
    };
    return bindings;
  }

  void changePage(int index) {
    pageBindings[index]?.dependencies();
    currentPage.value = index;
  }
}

class NavItem {
  final String icon;
  final String title;

  NavItem({required this.icon, required this.title});
}
