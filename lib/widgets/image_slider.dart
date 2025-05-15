import 'dart:async';
import 'package:get/get.dart';
import 'package:imboxo/utils/app_exports.dart';
import '../data/movie_trailer_model.dart';
import 'image_helper.dart';

class HeaderImageSlider extends StatefulWidget {
  final List<TrailerItem> movies;
  final Duration interval;

  const HeaderImageSlider({
    super.key,
    required this.movies,
    this.interval = const Duration(seconds: 15),
  });

  @override
  State<HeaderImageSlider> createState() => _HeaderImageSliderState();
}

class _HeaderImageSliderState extends State<HeaderImageSlider> {
  late PageController _controller;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();

    _timer = Timer.periodic(widget.interval, (timer) {
      if (_controller.hasClients) {
        _currentPage = (_currentPage + 1) % widget.movies.length;
        _controller.animateToPage(
          _currentPage,
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dimGrey.withOpacity(0.1),
      height: MediaQuery.sizeOf(context).height / 2.8,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              RenderNetworkImage(
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height / 2.8,
                imagePath: movie.poster,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black87,
                      Colors.transparent,
                      Colors.black12,
                    ],
                    stops: [0.10, 0.90, 3.0],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Buttons.primaryBtn(
                  paddingHorizontal: 14,
                  paddingVertical: 80,
                  context: context,
                  title: StaticStrings.watchNow,
                  event: () {},
                ),
              ).marginOnly(bottom: 20.h),
            ],
          );
        },
      ),
    );
  }
}
