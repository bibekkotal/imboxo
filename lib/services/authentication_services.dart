import '../repositories/authentication_repositories.dart';
import '../utils/app_exports.dart';
import 'package:dio/dio.dart' as dio_client;
import '../utils/colorful_log.dart';
import 'base.dart';

class AuthenticationServices extends AuthenticationRepository {
  @override
  Future<ApiResult> registration(
    String name,
    String phone,
    String email,
    String password,
    String confirmPassword,
  ) async {
    dio_client.FormData dataPayload = dio_client.FormData.fromMap({
      'name': name,
      'username': phone,
      'email': email,
      'password': confirmPassword,
      'role': '0',
    });
    return await ApiRequest().request(
      headers: {...HeaderType.multipart},
      body: dataPayload,
      method: ApiMethods.post,
      endpoint: API.register,
    );
  }

  @override
  Future<ApiResult> login(String email, String password) async {
    dio_client.FormData dataPayload = dio_client.FormData.fromMap({
      'email': email,
      'password': password,
    });
    return await ApiRequest().request(
      headers: {...HeaderType.multipart},
      body: dataPayload,
      method: ApiMethods.post,
      endpoint: API.login,
    );
  }

  @override
  Future<ApiResult> verifyEmail(String email, String otp) async {
    dio_client.FormData dataPayload = dio_client.FormData.fromMap({
      'email': email,
      'otp': otp,
    });
    return await ApiRequest().request(
      headers: {...HeaderType.multipart},
      body: dataPayload,
      method: ApiMethods.post,
      endpoint: API.verifyEmail,
    );
  }
}
