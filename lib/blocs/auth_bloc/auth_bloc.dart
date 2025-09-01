import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../data/models/auth_models.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final FlutterSecureStorage storage;

  AuthBloc({required this.authRepository})
    : storage = const FlutterSecureStorage(),
      super(AuthInitial()) {
    on<LoginStep1Requested>(_onLoginStep1Requested);
    on<LoginStep2Requested>(_onLoginStep2Requested);
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LogoutRequested>(_onLogoutRequested);
  }

  // Проверяем статус авторизации при создании блока
  @override
  void onEvent(AuthEvent event) {
    log('Auth Event: ${event.runtimeType}');
    super.onEvent(event);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final token = await storage.read(key: 'access_token');
      log('Вот наш токен: $token');

      if (token != null && token.isNotEmpty) {
        emit(AuthAuthenticated(accessToken: token));
        log('Авторизация прошла успешно');
      } else {
        emit(AuthUnauthenticated());
        log('Авторизация не прошла');
      }
    } catch (error) {
      emit(AuthFailure(error: error.toString()));
    }
  }

  Future<void> _onLoginStep1Requested(
    LoginStep1Requested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await authRepository.loginStep1(event.request);
      emit(LoginStep1Success(response: response));
      log('STEP1 RESPONSE: ${response.data.temporaryToken}');
    } catch (error) {
      emit(AuthFailure(error: error.toString()));
    }
  }

  Future<void> _onLoginStep2Requested(
    LoginStep2Requested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await authRepository.loginStep2(event.request);

      // Сохраняем токен
      await storage.write(key: 'access_token', value: response.accessToken);

      emit(LoginStep2Success(response: response));
      emit(AuthAuthenticated(accessToken: response.accessToken));

      log('ACCESS TOKEN SAVED: ${response.accessToken}');
    } catch (error) {
      emit(AuthFailure(error: error.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      // Удаляем токен
      await storage.delete(key: 'access_token');
      emit(AuthUnauthenticated());
      log('User logged out successfully');
    } catch (error) {
      emit(AuthFailure(error: error.toString()));
    }
  }

  // Вспомогательный метод для получения токена
  Future<String?> getAccessToken() async {
    return await storage.read(key: 'access_token');
  }

  // Вспомогательный метод для проверки авторизации
  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
