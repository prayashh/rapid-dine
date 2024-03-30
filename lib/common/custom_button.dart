import 'package:digital_menu/feature/edit/bloc/add%20item%20bloc/add_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final double textSize;
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  final VoidCallback onpressed;
  CustomButton(
      {super.key,
      required this.buttonColor,
      required this.text,
      required this.onpressed,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.textColor,
      required this.textSize});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h * buttonHeight,
      width: w * buttonWidth,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(buttonColor),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: w * textSize),
        ),
      ),
    );
  }
}
