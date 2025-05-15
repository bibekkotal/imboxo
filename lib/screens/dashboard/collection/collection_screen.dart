import 'dart:math';

import 'package:get/get.dart';
import '../../../utils/app_exports.dart';
import '../../../widgets/image_helper.dart';
import 'collection_controller.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final CollectionController controller = Get.put(CollectionController());

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    final Random random = Random();
    double itemWidth = (mediaWidth / 2) - 20;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _headerSection(context),
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(controller.tabs.length, (index) {
                  final isSelected = controller.selectedTabIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedTabIndex.value = index;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.tabs[index],
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            height: 3,
                            width: 20,
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.transparent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ).marginOnly(left: 20.w, bottom: 10.h, top: 15.h),
          ),
          Expanded(
            child: Obx(() {
              final List<Widget> leftColumn = [];
              final List<Widget> rightColumn = [];

              for (int i = 0; i < controller.movieListItem.length; i++) {
                final movie = controller.movieListItem[i];
                final height = 150.0 + random.nextInt(100);

                final item = Container(
                  width: itemWidth,
                  height: height,
                  margin: const EdgeInsets.only(bottom: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: RenderNetworkImage(
                    imagePath: movie.thumbnail,
                    fit: BoxFit.cover,
                  ),
                );

                if (i % 2 == 0) {
                  leftColumn.add(item);
                } else {
                  rightColumn.add(item);
                }
              }

              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Column(children: leftColumn)),
                    SizedBox(width: 10.w),
                    Expanded(child: Column(children: rightColumn)),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: mediaHeight / 8),
        ],
      ),
    );
  }

  Widget _headerSection(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return Container(
      color: AppColors.background,
      width: mediaWidth,
      child: Column(
        children: [
          Container(
            color: AppColors.background,
            constraints: BoxConstraints(minHeight: 20.h),
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              bottom: 15.h,
              top: 10.h,
            ),
            width: mediaWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: IconButton(
                    splashColor: AppColors.primary.withOpacity(0.1),
                    highlightColor: AppColors.primary.withOpacity(0.1),
                    splashRadius: 20.h,
                    icon: Transform.rotate(
                      angle: pi,
                      child: SvgPicture.asset(
                        AppImages.arrowRight,
                        height: 15.h,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Text(
                  StaticStrings.collection,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    fontFamily: CustomFonts.Poppins,
                  ),
                ),
                Spacer(),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: IconButton(
                        splashColor: AppColors.primary.withOpacity(0.5),
                        highlightColor: AppColors.primary.withOpacity(0.5),
                        splashRadius: 18,
                        icon: SvgPicture.asset(
                          AppImages.bellIcon,
                          height: 25.h,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Positioned(
                      right: 13.w,
                      top: 12.h,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(5.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            color: AppColors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).marginOnly(right: 15.w, left: 5.w),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 40.h,
                  width: 40.w,
                  child: RenderNetworkImage(
                    fit: BoxFit.cover,
                    imagePath: 'https://randomuser.me/api/portraits/men/52.jpg',
                  ),
                ),
              ],
            ),
          ),

          ///
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<CollectionController>();
    super.dispose();
  }
}
