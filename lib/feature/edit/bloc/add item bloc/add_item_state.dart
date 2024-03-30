part of 'add_item_bloc.dart';

abstract class AddItemState {}

abstract class AddItemActionState extends AddItemState {}

final class AddItemInitial extends AddItemState {}

class ImagePickedState extends AddItemState {
  final File imageFile;

  ImagePickedState(this.imageFile);
}

class ImageUnPickedState extends AddItemState {}

class DropDownValueSelectedState extends AddItemState {
  final String dropDownValueString;

  DropDownValueSelectedState({required this.dropDownValueString});
}

class ImageDisposedState extends AddItemState {}



class UploadItemLoadingState extends AddItemState {}

class UploadItemSucessState extends AddItemState {}

class UploadItemFailureState extends AddItemState {}
