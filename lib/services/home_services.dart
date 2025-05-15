import 'package:get/get.dart';

import '../data/preference_controller.dart';
import '../repositories/home_repositories.dart';
import '../utils/api_requests.dart';
import 'base.dart';

class HomeServices extends HomeRepositories {
  final _prefs = Get.find<PreferenceController>();

  @override
  Future<ApiResult> getMovieTrailerList() async {
    return await ApiRequest().request(
      headers: {...HeaderType.applicationJson},
      method: ApiMethods.get,
      endpoint: API.movieTrailerList,
    );
  }

  @override
  Future<ApiResult> getMovieList() async {
    return await ApiRequest().request(
      headers: {...HeaderType.applicationJson},
      method: ApiMethods.get,
      endpoint: API.movieList,
    );
  }

  @override
  Future<ApiResult> getMovieListUser() async {
    return await ApiRequest().request(
      headers: {
        "Content-Type": 'application/json',
        "Authorization": "Bearer ${_prefs.accessTokens}",
      },
      method: ApiMethods.post,
      body: {'user_id': _prefs.userId},
      endpoint: API.movieListUser,
    );
  }
}
