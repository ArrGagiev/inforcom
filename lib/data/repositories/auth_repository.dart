import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:inforcom/data/api/api_service.dart';
import 'package:inforcom/data/models/auth_models.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  // В auth_repository.dart
  Future<LoginStep1Response> loginStep1(LoginStep1Request request) async {
    try {
      final response = await dio.post(
        '/auth/login-step1',
        data: request.toJson(),
      );

      // Проверяем статус код
      if (response.statusCode != 200 && response.data['success'] != true) {
        throw Exception('Ошибка сервера: ${response.statusCode}');
      }

      final loginResponse = LoginStep1Response.fromJson(response.data);

      // Дополнительная проверка успешности операции
      if (!loginResponse.success) {
        throw Exception('Неверные учетные данные');
      }

      return loginResponse;
    } on DioException catch (error) {
      // Более детальная обработка ошибок
      if (error.response?.statusCode == 404) {
        throw Exception('Пользователь не найден');
      } else if (error.response?.statusCode == 422) {
        throw Exception('Неверный формат данных');
      }
      throw ApiService.handleError(error);
    } catch (e) {
      throw Exception('Ошибка авторизации: $e');
    }
  }

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------

  // В auth_repository.dart
  Future<LoginStep2Response> loginStep2(LoginStep2Request request) async {
    try {
      log('Sending loginStep2 request: ${request.toJson()}');

      final response = await dio.post(
        '/auth/login-step2',
        data: request.toJson(),
      );

      log('Response status: ${response.statusCode}');
      log('Response data: ${response.data}');

      // Проверяем, что ответ является Map
      if (response.data is! Map<String, dynamic>) {
        throw Exception('Неверный формат ответа от сервера');
      }

      final loginResponse = LoginStep2Response.fromJson(response.data);

      // Проверяем успешность операции
      if (!loginResponse.success) {
        throw Exception('Неверный код подтверждения');
      }

      // Дополнительная проверка на наличие accessToken
      if (loginResponse.accessToken.isEmpty) {
        throw Exception('Отсутствует access token');
      }

      return loginResponse;
    } on DioException catch (error) {
      log('DioError in loginStep2: ${error.message}');
      log('Error response: ${error.response?.data}');

      // Более детальная обработка ошибок Dio
      if (error.response?.statusCode == 400 ||
          error.response?.statusCode == 401) {
        throw Exception('Неверный код подтверждения');
      } else if (error.response?.statusCode == 404) {
        throw Exception('Сессия истекла или не найдена');
      }

      throw ApiService.handleError(error);
    } catch (e) {
      throw Exception('Ошибка подтверждения: $e');
    }
  }
}
