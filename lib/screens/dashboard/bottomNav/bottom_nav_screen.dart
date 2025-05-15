import 'dart:convert';
import 'dart:math';

import '../../../../utils/app_exports.dart';
import 'package:get/get.dart';

import 'bottom_nav_controller.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final controller = Get.find<BottomNavController>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    Future.delayed(const Duration(milliseconds: 100), () {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.background,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    });
    controller.context = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Obx(() => controller.screens[controller.currentPage.value]),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(
              () => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 15.h,
                ).copyWith(
                  bottom: MediaQuery.of(context).padding.bottom + 10.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...controller.navItems.asMap().entries.map((entry) {
                      int index = entry.key;
                      final item = entry.value;
                      return _buildNavItem(
                        item.icon,
                        item.title,
                        index == controller.currentPage.value,
                        () {
                          controller.changePage(index);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    String icon,
    String title,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<double>(begin: 1.0, end: isSelected ? 1.1 : 1.0),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(100.r),
              splashColor: AppColors.background.withOpacity(0.2),
              highlightColor: AppColors.background.withOpacity(0.1),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.elasticOut,
                    tween: Tween<double>(begin: 0, end: isSelected ? 1.0 : 0),
                    builder: (context, animValue, _) {
                      return Transform.rotate(
                        angle: (1 - animValue) * pi / 2,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 75.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? AppColors.background
                                    : AppColors.transparent,
                            shape: BoxShape.circle,
                            boxShadow:
                                isSelected
                                    ? [
                                      BoxShadow(
                                        color: AppColors.black.withOpacity(0.3),
                                        blurRadius: 5.0,
                                        spreadRadius: 3.0,
                                      ),
                                    ]
                                    : null,
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (
                      Widget child,
                      Animation<double> animation,
                    ) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.5),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            icon,
                            key: ValueKey<bool>(isSelected),
                            width: 22.h,
                            height: 22.h,
                            color:
                                isSelected
                                    ? AppColors.primary
                                    : AppColors.white,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            title,
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.white,
                              fontSize: 11.sp,
                              fontFamily: CustomFonts.Poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<BottomNavController>();
    super.dispose();
  }
}
