import '../utils/api_requests.dart';

abstract class AuthenticationRepository {
  Future<ApiResult> login(String email, String password);

  Future<ApiResult> registration(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  );

  Future<ApiResult> verifyEmail(String email, String otp);
}
