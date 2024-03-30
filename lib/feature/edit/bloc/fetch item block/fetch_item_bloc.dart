import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:digital_menu/feature/edit/data/model/iitem_model.dart';
import 'package:digital_menu/feature/edit/data/repository/get_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_item_event.dart';
part 'fetch_item_state.dart';

class FetchItemBloc extends Bloc<FetchItemEvent, FetchItemState> {
  FetchItemBloc() : super(FetchItemInitial()) {
    on<FetchItemEvent>(fetchItemEvent);
  }

  Future<FutureOr<void>> fetchItemEvent(
      FetchItemEvent event, Emitter<FetchItemState> emit) async {
    emit(FetchProductLoadingState());
     try {
      emit(FetchProductLoadingState());
      List<ItemModel> items = await ItemRepo.fetchItems();

      if (items.isNotEmpty) {
        emit(FetchProductSucessState(items: items));
      } else {
        log("List is empty");
        emit(FetchProductEmptyState());
      }
    } catch (e) {
      emit(FetchProductUnsucessState());
    }
  }
}
