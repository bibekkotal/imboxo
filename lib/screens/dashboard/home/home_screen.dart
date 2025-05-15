import 'package:get/get.dart';
import '../../../data/movie_trailer_model.dart';
import '../../../utils/app_exports.dart';
import '../../../widgets/image_helper.dart';
import '../../../widgets/image_slider.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    controller.pageContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _headerSection(context),
            _titleSection(context, StaticStrings.latestRelease, () {}),
            Obx(
              () => SizedBox(
                height: mediaHeight / 4.8,
                width: mediaWidth,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = controller.movieListItem[index];
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: RenderNetworkImage(
                        width: mediaWidth / 2.8,
                        fit: BoxFit.cover,
                        imagePath: movie.thumbnail,
                      ),
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          SizedBox(width: 15.w),
                  itemCount: controller.movieListItem.length,
                ),
              ),
            ),
            _titleSection(context, StaticStrings.trendingNow, () {}),
            Obx(
              () => SizedBox(
                height: mediaHeight / 7,
                width: mediaWidth,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = controller.movieListItem[index];
                    return Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: RenderNetworkImage(
                                  width: mediaWidth / 2.5,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  imagePath: movie.thumbnail,
                                ),
                              ),
                              Positioned(
                                bottom: 10.h,
                                left: 15.w,
                                child: Material(
                                  color: AppColors.primary.withOpacity(0.5),
                                  shape: const CircleBorder(),
                                  child: InkWell(
                                    customBorder: const CircleBorder(),
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: SvgPicture.asset(
                                        AppImages.playIcon,
                                        color: Colors.white,
                                        height: 10.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: mediaWidth / 2.5,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: mediaWidth / 3,
                                child: Text(
                                  movie.name.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                    fontFamily: CustomFonts.Poppins,
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  AppImages.threeDotVerticalIcon,
                                  height: 15.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          SizedBox(width: 15.w),
                  itemCount: controller.movieListItem.length,
                ),
              ),
            ),

            Container(
              color: AppColors.background,
              margin: EdgeInsets.only(top: 30.h),
              padding: EdgeInsets.symmetric(
                vertical: 25.w,
              ).copyWith(bottom: 30.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        StaticStrings.top10,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                          fontFamily: CustomFonts.Poppins,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ).paddingOnly(left: 25.w, right: 25.w, bottom: 15.h),

                  Obx(
                    () => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(controller.tabs.length, (
                          index,
                        ) {
                          final isSelected =
                              controller.selectedTabIndex.value == index;
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
                                      fontSize: 14.sp,
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
                    ).marginOnly(left: 20.w, bottom: 10.h),
                  ),

                  Obx(
                    () => SizedBox(
                      height: mediaHeight / 8,
                      width: mediaWidth,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final movie = controller.movieListItem[index];
                          return Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: RenderNetworkImage(
                                        width: mediaWidth / 4.5,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        imagePath: movie.thumbnail,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primary.withOpacity(
                                            0.4,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontSize: 60.sp,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: CustomFonts.Poppins,
                                                foreground:
                                                    Paint()
                                                      ..style =
                                                          PaintingStyle.stroke
                                                      ..strokeWidth = 3
                                                      ..color = AppColors.white,
                                              ),
                                            ),

                                            Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                fontSize: 60.sp,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                width: mediaWidth / 5,
                                child: Text(
                                  movie.name.toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                    fontFamily: CustomFonts.Poppins,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) =>
                                SizedBox(width: 15.w),
                        itemCount: controller.movieListItem.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _titleSection(context, StaticStrings.animalsMovies, () {}),
            Obx(
              () => SizedBox(
                height: mediaHeight / 4.8,
                width: mediaWidth,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = controller.movieListItem[index];
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: RenderNetworkImage(
                        width: mediaWidth / 2.8,
                        fit: BoxFit.cover,
                        imagePath: movie.thumbnail,
                      ),
                    );
                  },
                  separatorBuilder:
                      (BuildContext context, int index) =>
                          SizedBox(width: 15.w),
                  itemCount: controller.movieListItem.length,
                ),
              ),
            ),
            SizedBox(height: mediaHeight / 5),
          ],
        ),
      ),
    );
  }

  Widget _titleSection(BuildContext context, String title, VoidCallback onGo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
            fontFamily: CustomFonts.Poppins,
          ),
          textAlign: TextAlign.left,
        ),
        Material(
          color: Colors.transparent,
          child: IconButton(
            splashColor: AppColors.primary.withOpacity(0.3),
            highlightColor: AppColors.primary.withOpacity(0.3),
            splashRadius: 20.h,
            icon: SvgPicture.asset(AppImages.arrowRight, height: 15.h),
            onPressed: onGo,
          ),
        ),
      ],
    ).paddingOnly(left: 25.w, top: 20.h, right: 25.w, bottom: 10.h);
  }

  Widget _headerSection(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: mediaHeight / 2.8,
      width: mediaWidth,
      child: Stack(
        children: [
          Obx(() => HeaderImageSlider(movies: controller.trailerItem.value)),
          Container(
            constraints: BoxConstraints(minHeight: 20.h, maxHeight: 50.h),
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            width: mediaWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: mediaWidth / 4,
                  fit: BoxFit.contain,
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
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }
}
