import 'package:get/get.dart';

import '../../../data/movie_trailer_model.dart';
import '../../../repositories/home_repositories.dart';
import '../../../utils/app_exports.dart';
import '../../../utils/message_helper.dart';

class CollectionController extends GetxController {
  late BuildContext pageContext;
  final _repo = Get.find<HomeRepositories>();
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
  void onInit() {
    fetchMovieList();
    super.onInit();
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
}
