import 'package:get/get.dart';

import '../../../data/movie_trailer_model.dart';
import '../../../repositories/home_repositories.dart';
import '../../../utils/app_exports.dart';
import '../../../utils/colorful_log.dart';
import '../../../utils/message_helper.dart';

class HomeController extends GetxController {
  late BuildContext pageContext;
  final _repo = Get.find<HomeRepositories>();

  RxList<TrailerItem> trailerItem = <TrailerItem>[].obs;
  RxList<MovieListItem> movieListItem = <MovieListItem>[].obs;

  final List<String> tabs = [
    'All',
    'Hindi',
    'English',
    'Bengali',
    'Urdu',
    'Chinese',
  ];

  RxInt selectedTabIndex = 0.obs;

  @override
  void onReady() async {
    await Future.wait([
      fetchMovieTrailerList(),
      fetchMovieList(),
      // fetchMovieListUser(),
    ]);
    super.onReady();
  }

  Future fetchMovieTrailerList() async {
    trailerItem.clear();
    ApiResult result = await _repo.getMovieTrailerList();
    if (result.response?.status == 200 || result.response?.status == 201) {
      MovieTrailerResponse response = MovieTrailerResponse.fromJson(
        result.response!.data!,
      );
      if (response.success == 1) {
        if (!pageContext.mounted) return;
        if (response.data.isNotEmpty) {
          trailerItem.addAll(response.data);
        }
      }
    } else {
      if (!pageContext.mounted) return;
      MessageHelper.error(
        message: result.response!.data!['message'] ?? 'Something went wrong!',
        context: pageContext,
      );
    }
  }

  Future fetchMovieList() async {
    movieListItem.clear();
    ApiResult result = await _repo.getMovieList();
    if (result.response?.status == 200 || result.response?.status == 201) {
      MovieListResponse response = MovieListResponse.fromJson(
        result.response!.data!,
      );
      if (response.success == 1) {
        if (!pageContext.mounted) return;
        if (response.data.isNotEmpty) {
          movieListItem.addAll(response.data);
        }
      }
    } else {
      if (!pageContext.mounted) return;
      MessageHelper.error(
        message: result.response!.data!['message'] ?? 'Something went wrong!',
        context: pageContext,
      );
    }
  }

  Future fetchMovieListUser() async {
    movieListItem.clear();
    ApiResult result = await _repo.getMovieListUser();
    if (result.response?.status == 200 || result.response?.status == 201) {
      MovieListResponse response = MovieListResponse.fromJson(
        result.response!.data!,
      );
      if (response.success == 1) {
        if (!pageContext.mounted) return;
        if (response.data.isNotEmpty) {
          movieListItem.addAll(response.data);
        }
      }
    } else {
      if (!pageContext.mounted) return;
      MessageHelper.error(
        message: result.response!.data!['message'] ?? 'Something went wrong!',
        context: pageContext,
      );
    }
  }
}
