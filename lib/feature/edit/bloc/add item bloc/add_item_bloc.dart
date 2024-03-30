import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:digital_menu/feature/edit/data/repository/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc() : super(AddItemInitial()) {
    on<ImagePickedEvent>(imagePickedEvent);
    on<DropDownValueSelectedEvent>(dropDownValueSelectedEvent);
    on<ImageDisposedEvent>(imageDisposedEvent);
    on<UploadItemEvent>(uploadItemEvent);
  }

  Future<FutureOr<void>> imagePickedEvent(
      ImagePickedEvent event, Emitter<AddItemState> emit) async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        emit(ImagePickedState(File(pickedImage.path)));
      } else {
        emit(ImageUnPickedState());
      }
    } catch (e) {
      emit(ImageUnPickedState());
    }
  }

  FutureOr<void> dropDownValueSelectedEvent(
      DropDownValueSelectedEvent event, Emitter<AddItemState> emit) {
    emit(
      DropDownValueSelectedState(dropDownValueString: event.dropDownValue),
    );
  }

  void listen(Null Function(dynamic state) param0) {}

  FutureOr<void> imageDisposedEvent(
      ImageDisposedEvent event, Emitter<AddItemState> emit) {
    emit(ImageDisposedState());
  }



  FutureOr<void> uploadItemEvent(
      UploadItemEvent event, Emitter<AddItemState> emit) async {
    emit(UploadItemLoadingState());
    Post post = Post(
      imageFile: event.image,
      category: event.category,
      itemDescription: event.itemDescription,
      itemName: event.itemName,
      price: event.price,
    );
    Post.postItem(post);

    // log(event.image.toString());
    // log(event.category);
    // log(event.itemDescription);
    // log(event.itemName);

    // log(event.price.toString());
  }
}
