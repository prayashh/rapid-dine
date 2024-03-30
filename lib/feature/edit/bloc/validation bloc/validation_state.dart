part of 'validation_bloc.dart';

@immutable
sealed class ValidationState {}

final class ValidationInitial extends ValidationState {}

class ValidState extends ValidationState {}

class InvalidState extends ValidationState {}
