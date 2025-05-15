import '../utils/app_exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? imageUrl;
  final String displayName;

  const CustomAppBar({
    super.key,
    required this.imageUrl,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.sizeOf(context).width;
    double mediaHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20.h,
            backgroundImage:
                imageUrl != null && imageUrl != ''
                    ? NetworkImage(imageUrl!)
                    : const AssetImage(AppImages.userPlaceHolder)
                        as ImageProvider,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello, $displayName',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Text(
                "Today, 12:30",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                padding: EdgeInsets.all(9.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.green, width: 1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppImages.bellIcon,
                  width: 20.h,
                  height: 20.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
