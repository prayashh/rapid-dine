import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:digital_menu/common/custom_button.dart';
import 'package:digital_menu/config/colors.dart';
import 'package:digital_menu/feature/edit/bloc/add%20item%20bloc/add_item_bloc.dart';
import 'package:digital_menu/feature/edit/bloc/fetch%20item%20block/fetch_item_bloc.dart';
import 'package:digital_menu/feature/edit/presentation/ui/example.dart';
import 'package:digital_menu/feature/edit/presentation/widget/custom_textField.dart';
import 'package:digital_menu/feature/edit/presentation/widget/product_card_widget.dart';
import 'package:digital_menu/feature/edit/presentation/widget/shimmer_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart ' as http;

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final _formKey = GlobalKey<FormState>();

  AddItemBloc addItemBloc = AddItemBloc();
  FetchItemBloc fetchItemBloc = FetchItemBloc();

  final TextEditingController itemNameController = TextEditingController();

  final TextEditingController itemDescriptionController =
      TextEditingController();

  final TextEditingController priceController = TextEditingController();
  File? imageFile;
  String? categoryValue;
  Future<void> uploaditem() async {
    log("uploading");
    var request = http.MultipartRequest("POST",
        Uri.parse("https://rapid-dine-backend.onrender.com/api/item/add"));
    log(imageFile!.path);
    request.fields['image'] = imageFile!.path;
    request.fields['itemName'] = "jalk qefjnha";
    request.fields['price'] = "200";
    request.fields['description'] = "ja qfekjnhlka";
    request.fields['category'] = "hello";
    // request.fields.cast();

    request.headers['Content-Type'] = "application/json";

    var response = await request.send();
    log(response.statusCode.toString());

    log(response.stream.toString());
    response.stream.transform(utf8.decoder).listen((value) {
      log(value);
    });
  }

  @override
  void initState() {
    fetchItemBloc.add(FetchProductEvent());
    super.initState();
  }

  void clearController() {
    itemNameController.clear();
    itemDescriptionController.clear();
    priceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: beidge,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const Example(),
                ),
              );
            },
            icon: const Icon(
              Icons.notification_important_rounded,
              size: 30,
            ),
          ),
          IconButton(
              onPressed: () {
                fetchItemBloc.add(FetchProductEvent());
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                color: red,
                height: h * 0.07,
                width: w * 0.8,
                child: const Text(
                  "EDIT ITEMS IN MENU",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: h * 0.01),
              Container(
                height: h * 0.65,
                width: w * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Form(
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          addItemBloc.add(ImagePickedEvent());
                        },
                        child: Container(
                          height: h * 0.15,
                          width: w * 0.3,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: BlocBuilder(
                            bloc: addItemBloc,
                            builder: (context, state) {
                              switch (state.runtimeType) {
                                case ImagePickedState:
                                  final successState =
                                      state as ImagePickedState;
                                  imageFile = successState.imageFile;
                                  return Image.file(successState.imageFile);
                                case ImageDisposedState:
                                  imageFile == null;
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/upload-image-icon.png",
                                    ),
                                  );
                                default:
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      "assets/images/upload-image-icon.png",
                                    ),
                                  );
                              }
                            },
                          ),
                        ),
                      ),
                      CustomTextField(
                        controller: itemNameController,
                        height: 0.08,
                        hintText: "Enter Product Name",
                        keyboardType: TextInputType.name,
                        labelText: "Item Name",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Item name Cannot be Empty";
                          }

                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: itemDescriptionController,
                        height: 0.1,
                        hintText: "Enter Product Product Description",
                        keyboardType: TextInputType.name,
                        labelText: "Item Description",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Description Cannot be Empty";
                          }

                          return null;
                        },
                      ),
                      CustomTextField(
                        controller: priceController,
                        height: 0.08,
                        hintText: "Price",
                        keyboardType: TextInputType.number,
                        labelText: "Enter Price",
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Price Cannot be Empty";
                          }
                          return null;
                        },
                      ),
                      buildCategoryDropDown(context),
                      BlocProvider(
                        create: (context) => AddItemBloc(),
                        child: CustomButton(
                          textSize: 0.05,
                          textColor: Colors.white,
                          buttonColor: red,
                          text: "DONE",
                          onpressed: () {
                            uploaditem();
                            // if (imageFile == null) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text('Please select an image.'),
                            //     ),
                            //   );
                            // }

                            // if (_formKey.currentState!.validate()) {
                            //   addItemBloc.add(
                            //     UploadItemEvent(
                            //       image: imageFile,
                            //       itemName: itemNameController.text.trim(),
                            //       itemDescription:
                            //           itemDescriptionController.text.trim(),
                            //       price:
                            //           double.parse(priceController.text.trim()),
                            //       category: categoryValue.toString(),
                            //     ),
                            //   );
                            //   // ScaffoldMessenger.of(context).showSnackBar(
                            //   //   const SnackBar(
                            //   //       content:
                            //   //           Text('Form submitted successfully')),
                            //   // );
                            // }
                          },
                          buttonHeight: 0.08,
                          buttonWidth: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder(
                bloc: fetchItemBloc,
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case FetchProductLoadingState:
                      return const ShimmerProductCard();
                    case FetchProductSucessState:
                      final successState = state as FetchProductSucessState;
                      final items = successState.items;
                      final item = items.isNotEmpty ? items[0] : null;
                      if (item != null) {
                        log(item.category);
                        return CustomProductCard(
                            itemName: item.itemName,
                            description: item.description,
                            category: item.category,
                            price: item.price,
                            imageUrl: item.imageUrl);
                      } else {
                        return const Text("Item list is empty");
                      }
                    case FetchProductEmptyState:
                      return const Text("Item list is empty");
                    default:
                      return const Text("");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryDropDown(BuildContext context) {
    categoryValue = "Main Course";

    List<String> options = [
      "Main Course",
      "Beverages",
      "Appetizers",
      "Deserts",
    ];

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: beidge,
        border: Border.all(color: Colors.black, width: w * 0.005),
      ),
      height: h * 0.06,
      margin: EdgeInsets.symmetric(horizontal: w * 0.1),
      alignment: AlignmentDirectional.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder(
            bloc: BlocProvider.of<AddItemBloc>(context),
            builder: (context, state) {
              switch (state.runtimeType) {
                case DropDownValueSelectedState:
                  final sucessState = state as DropDownValueSelectedState;
                  categoryValue = sucessState.dropDownValueString;

                  return Text(sucessState.dropDownValueString);

                default:
                  return Text(categoryValue.toString());
              }
            },
          ),
          DropdownButton(
            focusColor: Colors.red,
            items: options.map((String option) {
              return DropdownMenuItem(value: option, child: Text(option));
            }).toList(),
            onChanged: (String? newValue) {
              BlocProvider.of<AddItemBloc>(context).add(
                  DropDownValueSelectedEvent(
                      dropDownValue: newValue.toString()));
            },
          )
        ],
      ),
    );
  }
}
