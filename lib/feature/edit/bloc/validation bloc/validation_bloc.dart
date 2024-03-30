import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  ValidationBloc() : super(ValidationInitial()) {
    on<ValidateEvent>(validateEvent);
  }

  FutureOr<void> validateEvent(
      ValidateEvent event, Emitter<ValidationState> emit) {
    emit(InvalidState());
  }
}
