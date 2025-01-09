import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/router/router.dart';
import 'package:otm_template/service/api/rest_api.dart';
import 'package:otm_template/utils/index.dart';
import 'package:otm_template/utils/local_cache.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

BaseOptions baseOptions = BaseOptions(
  baseUrl: "",
  receiveTimeout: const Duration(seconds: 90),
  connectTimeout: const Duration(seconds: 30),
);

class DioClient {
  // ignore: non_constant_identifier_names
  late RestAPI API;
  DioClient() {
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptor());
    API = RestAPI(dio);
  }
}

class DioInterceptor extends Interceptor {
  Dio dio = Dio(baseOptions);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await LocalCache.getSecured(StorageKeys.token);
    String path = options.uri.path;
    if (path.contains("/refresh-token")) {
      token = await LocalCache.getSecured(StorageKeys.refreshToken);
    }

    options.headers.addAll({
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": 'Bearer $token'
    });

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // AppRouter.goToPageAndRemoveUntil(RouteNames.login, (r) => false);
      showAlertError("Phiên đăng nhập đã hết hạn");
    }
    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    var response = await dio.post("/refresh-token");
    if (response.statusCode == 200) {
      //[ToDo] xử  lý sau
      // LoginResponse loginResponse = LoginResponse.fromJson(response.data);

      //   await setAuthenticationValuesInMemoryManagement(
      //       accessToken: loginResponse.accessToken,
      //       refreshToken: loginResponse.refreshToken);
    }
    return response;
  }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //   );

  //   return dio.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }
}
