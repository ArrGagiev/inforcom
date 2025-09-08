part of 'support_bloc.dart';

abstract class SupportState extends Equatable {
  const SupportState();

  @override
  List<Object> get props => [];
}

class SupportInitial extends SupportState {}

class SupportLoading extends SupportState {}

class SupportLoaded extends SupportState {
  final List<SupportPhoneModel> phones;

  const SupportLoaded({required this.phones});

  @override
  List<Object> get props => [phones];
}

class SupportError extends SupportState {
  final String error;

  const SupportError({required this.error});

  @override
  List<Object> get props => [error];
}
