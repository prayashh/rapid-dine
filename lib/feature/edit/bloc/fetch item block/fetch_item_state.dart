part of 'fetch_item_bloc.dart';

@immutable
abstract class FetchItemState {}

abstract class FetchItemActionState extends FetchItemState {}

final class FetchItemInitial extends FetchItemState {}

class FetchProductSucessState extends  FetchItemState {
  final List<ItemModel> items;

  FetchProductSucessState({required this.items});
}

class FetchProductUnsucessState extends  FetchItemState {}

class FetchProductLoadingState extends  FetchItemState {}

class FetchProductEmptyState extends  FetchItemState {}
