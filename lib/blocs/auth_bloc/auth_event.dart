part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginStep1Requested extends AuthEvent {
  final LoginStep1Request request;

  const LoginStep1Requested({required this.request});

  @override
  List<Object> get props => [request];
}

class LoginStep2Requested extends AuthEvent {
  final LoginStep2Request request;

  const LoginStep2Requested({required this.request});

  @override
  List<Object> get props => [request];
}

class CheckAuthStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}
