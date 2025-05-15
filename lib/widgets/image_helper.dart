import 'package:cached_network_image/cached_network_image.dart';

import '../utils/app_exports.dart';

class RenderNetworkImage extends StatefulWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? imageColor;
  final BlendMode? blendMode;

  const RenderNetworkImage({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.imageColor,
    this.blendMode,
  });

  @override
  State<RenderNetworkImage> createState() => _RenderNetworkImageState();
}

class _RenderNetworkImageState extends State<RenderNetworkImage> {
  @override
  Widget build(BuildContext context) {
    final paddingValue = (widget.height ?? 100);
    return CachedNetworkImage(
      imageUrl: widget.imagePath,
      color: widget.imageColor,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      colorBlendMode: widget.blendMode,
      placeholder:
          (context, url) => SizedBox(
            width: widget.width,
            height: widget.height,
            child: LinearProgressIndicator(
              color: AppColors.background.withOpacity(0.9),
              backgroundColor: AppColors.backgroundDim.withOpacity(0.9),
            ),
          ),
      errorWidget:
          (context, url, error) => SizedBox(
            width: widget.width,
            height: widget.height,
            child: Padding(
              padding: EdgeInsets.all(paddingValue / 10 + 50),
              child: SvgPicture.asset(
                AppImages.noImageFound,
                fit: BoxFit.contain,
                color: AppColors.backgroundDim.withOpacity(0.1),
              ),
            ),
          ),
    );
  }
}
