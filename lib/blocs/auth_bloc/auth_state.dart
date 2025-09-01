part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String accessToken;

  const AuthAuthenticated({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}

class AuthUnauthenticated extends AuthState {}

class LoginStep1Success extends AuthState {
  final LoginStep1Response response;

  const LoginStep1Success({required this.response});

  @override
  List<Object> get props => [response];
}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginStep2Success extends AuthState {
  final LoginStep2Response response;

  const LoginStep2Success({required this.response});

  @override
  List<Object> get props => [response];
}
