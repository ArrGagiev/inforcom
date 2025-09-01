import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://mobile-rest.inforkom.ru',
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  static Dio get dio => _dio;

  // Обработка ошибок
  static dynamic handleError(DioException error) {
    log('HandleError called: ${error.message}');

    if (error.response != null) {
      log('Error response data: ${error.response!.data}');

      final errorData = error.response!.data;
      final errorMessage = errorData is Map
          ? errorData['message'] ?? errorData['detail'] ?? 'Неизвестная ошибка'
          : errorData.toString();

      switch (error.response!.statusCode) {
        case 404:
          throw Exception('Не найдено: $errorMessage');
        case 422:
          throw Exception('Ошибка валидации: $errorMessage');
        default:
          throw Exception('Ошибка сервера: $errorMessage');
      }
    } else {
      throw Exception('Ошибка сети: ${error.message}');
    }
  }
}
