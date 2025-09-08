import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inforcom/data/models/support_phone_model.dart';
import 'package:inforcom/data/repositories/support_repository.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  final SupportRepository supportRepository;

  SupportBloc({required this.supportRepository}) : super(SupportInitial()) {
    on<LoadSupportPhones>(_onLoadSupportPhones);
  }

  Future<void> _onLoadSupportPhones(
    LoadSupportPhones event,
    Emitter<SupportState> emit,
  ) async {
    emit(SupportLoading());

    try {
      final response = await supportRepository.getSupportPhones();
      emit(SupportLoaded(phones: response.data));
    } catch (e) {
      emit(SupportError(error: e.toString()));
    }
  }
}
