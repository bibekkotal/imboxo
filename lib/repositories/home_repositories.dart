import '../utils/api_requests.dart';

abstract class HomeRepositories {
  Future<ApiResult> getMovieTrailerList();
  Future<ApiResult> getMovieList();
  Future<ApiResult> getMovieListUser();
}
