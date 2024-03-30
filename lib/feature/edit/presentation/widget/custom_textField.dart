// ignore_for_file: file_names

import 'package:digital_menu/config/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final double height;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.height,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        // alignment: AlignmentDirectional.center,
        height: h * height,
        decoration: const BoxDecoration(),
        margin: EdgeInsets.symmetric(horizontal: w * 0.1),
        child: TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: h * 0.005, horizontal: w * 0.03),
            errorStyle: const TextStyle(fontSize: 10),
            fillColor: beidge,
            filled: true,
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
          ),
        ),
      ),
    );
  }
}
