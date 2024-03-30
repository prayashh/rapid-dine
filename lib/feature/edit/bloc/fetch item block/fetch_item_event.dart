part of 'fetch_item_bloc.dart';

@immutable
sealed class FetchItemEvent {}

class FetchProductEvent extends FetchItemEvent {}
