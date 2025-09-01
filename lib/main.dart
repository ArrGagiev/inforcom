import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:inforcom/blocs/auth_bloc/auth_bloc.dart';
import 'package:inforcom/core/app/app.dart';
import 'package:inforcom/data/api/api_service.dart';
import 'package:inforcom/data/repositories/auth_repository.dart';
import 'package:yandex_maps_mapkit/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init.initMapkit(apiKey: '355b4311-fda5-4a1c-b7a1-f5a84770ccae');

  // ПРЕДВАРИТЕЛЬНАЯ ПРОВЕРКА ТОКЕНА
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'access_token');
  final isAuthenticated = token != null && token.isNotEmpty;

  final AuthRepository authRepository = AuthRepository(dio: ApiService.dio);

  runApp(
    BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: authRepository)..add(CheckAuthStatus()),
      child: App(isAuthenticated: isAuthenticated),
    ),
  );
}
