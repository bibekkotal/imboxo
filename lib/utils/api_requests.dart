import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get/get.dart';
import '../navigation/route_names.dart';
import 'colorful_log.dart';
import '../services/base.dart';

class ApiMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
  static const String head = 'HEAD';
  static const String options = 'OPTIONS';
}

class HeaderType {
  static const Map<String, dynamic> multipart = {
    "Content-Type": 'multipart/form-data',
  };
  static const Map<String, dynamic> applicationJson = {
    "Content-Type": 'application/json',
  };
}

class ApiStatus {
  final int status;
  final Map<String, dynamic>? data;

  ApiStatus({required this.status, required this.data});
}

class ApiResult {
  final bool success;
  final ApiStatus? response;
  final Exception? exception;
  final String? errorType;
  final String? message;

  ApiResult({
    required this.success,
    this.response,
    this.exception,
    this.errorType,
    this.message,
  });
}

class ApiRequest {
  final Dio _dio;

  ApiRequest() : _dio = Dio() {
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.baseUrl = API.baseUrl;

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (
      HttpClient client,
    ) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<ApiResult> request({
    required String method,
    required String endpoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final options = Options(method: method, headers: headers);

      final response = await _dio.request(
        endpoint,
        options: options,
        queryParameters: queryParameters,
        data: body,
      );

      ColorLog.blue(response.realUri);

      return ApiResult(
        success: true,
        response: ApiStatus(
          status: response.statusCode ?? 0,
          data: response.data,
        ),
        exception: null,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 &&
          e.response?.data['message']?.toString().startsWith('JWT token') ==
              true) {
        ColorLog.white(e.response!.realUri);
        Get.offAllNamed(RouteNames.login);
      }

      ColorLog.white(e.response?.realUri ?? 'No URI');

      return ApiResult(
        success: false,
        response: ApiStatus(
          status: e.response?.statusCode ?? 0,
          data:
              (e.response != null && e.response!.data is Map<String, dynamic>)
                  ? e.response!.data
                  : {"message": e.response?.data.toString()},
        ),
        exception: e,
      );
    } on Exception catch (e) {
      return ApiResult(
        success: false,
        response: null,
        exception: e,
        errorType: "UnknownError",
        message: "An unknown error occurred: ${e.toString()}",
      );
    }
  }
}
