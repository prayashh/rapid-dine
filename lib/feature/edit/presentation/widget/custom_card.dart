import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color textColor;
  final Color color;

  final double width;
  final String text;
  final Color outlineColor;
  const CustomCard(
      {super.key,
      required this.text,
      required this.color,
      required this.outlineColor,
      required this.width,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: AlignmentDirectional.center,
      height: double.maxFinite,
      width: w * width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: outlineColor, width: 2),
      ),
      child: Text(
        text,
        maxLines: 1,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
