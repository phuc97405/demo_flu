import 'dart:convert';

import 'package:demo_flu/core/utils/get_storage_key.dart';
import 'package:demo_flu/services/data/model/token_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class MyApiProvide {
  final GetStorage _getStorage = GetStorage();
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "https://api-mildang.brickmate.kr/api/v1/",
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: 'application/json'));

  MyApiProvide() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (option, handler) async {
      option.headers['Accept'] = 'application/json';
      String? token = _getStorage.read(GetStorageKey.accessToken);
      option.headers['Authorization'] = 'Bearer $token';
      return handler.next(option);
    }, onError: (error, handle) async {
      if (error.response?.statusCode == 401) {
        //token is authorized
        final newAccessToken = await refreshToken();
        if (newAccessToken != null) {
          _dio.options.headers['Authorization'] = 'Bearer $newAccessToken';
        }
      }
      return handle.next(error);
    }));
  }

  Future<String?> refreshToken() async {
    try {
      final refreshToken = _getStorage.read(GetStorageKey.refreshToken);
      final response = await _dio.post('/authentication/refresh',
          data: {'refreshToken': refreshToken});
      final newAccessToken = response.data['accessToken'];
      _getStorage.write(GetStorageKey.accessToken, newAccessToken);
      return newAccessToken;
    } catch (exception) {
      _getStorage.erase();
      //Get.offAllNamed(Routes.login);
    }
    return null;
  }

  Future<TokenModel> login(Map<String, dynamic> map) async {
    try {
      final res = await _dio.post('authentication/login', data: map);
      final json = jsonDecode(res.toString());

      // print('running: ${json['data']['token']}');
      return tokenModelFromJson(jsonEncode(json['data']['token']));
    } on DioException catch (err) {
      if (err.response?.statusCode == 401) {
        return Future.error("Invalid Credential");
      } else {
        return Future.error("Internal Server Error");
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
