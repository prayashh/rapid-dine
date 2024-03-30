part of 'validation_bloc.dart';

@immutable
sealed class ValidationEvent {}

class ValidateEvent extends ValidationEvent {}
