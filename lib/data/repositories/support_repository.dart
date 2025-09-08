import 'package:dio/dio.dart';
import 'package:inforcom/data/api/api_service.dart';
import 'package:inforcom/data/models/support_phone_model.dart';

class SupportRepository {
  final Dio dio;

  SupportRepository({required this.dio});

  Future<SupportResponse> getSupportPhones() async {
    try {
      final response = await dio.get(
        '/support',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return SupportResponse.fromJson(response.data);
      } else {
        throw Exception('Ошибка при получении телефонов поддержки');
      }
    } on DioException catch (error) {
      throw ApiService.handleError(error);
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }
}
