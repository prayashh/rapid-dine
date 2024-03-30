part of 'add_item_bloc.dart';

@immutable
sealed class AddItemEvent {}

class ImagePickedEvent extends AddItemEvent {}

class DropDownValueSelectedEvent extends AddItemEvent {
  final String dropDownValue;

  DropDownValueSelectedEvent({required this.dropDownValue});
}

class ImageDisposedEvent extends AddItemEvent {}



class UploadItemEvent extends AddItemEvent {
  final File? image;
  final String itemName;
  final String itemDescription;
  final double price;
  final String category;

  UploadItemEvent(
      {required this.image,
      required this.itemName,
      required this.itemDescription,
      required this.price,
      required this.category});
}
