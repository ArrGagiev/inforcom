import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:inforcom/data/api/api_service.dart';
import 'package:inforcom/data/models/auth_models.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  Future<LoginStep1Response> loginStep1(LoginStep1Request request) async {
    try {
      final response = await dio.post(
        '/auth/login-step1',
        data: request.toJson(),
      );

      return LoginStep1Response.fromJson(response.data);
    } on DioException catch (error) {
      throw ApiService.handleError(error);
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------

  Future<LoginStep2Response> loginStep2(LoginStep2Request request) async {
    try {
      log('Sending loginStep2 request: ${request.toJson()}');

      final response = await dio.post(
        '/auth/login-step2',
        data: request.toJson(),
      );

      log('Response status: ${response.statusCode}');
      log('Response data: ${response.data}');
      log('Response type: ${response.data.runtimeType}');

      // Временная проверка
      if (response.data is! Map<String, dynamic>) {
        log('ERROR: Response is not a map!');
        throw Exception('Invalid response format');
      }

      return LoginStep2Response.fromJson(response.data);
    } on DioException catch (error) {
      log('DioError in loginStep2: ${error.message}');
      log('Error response: ${error.response?.data}');
      log('Error status: ${error.response?.statusCode}');
      throw ApiService.handleError(error);
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }
}
