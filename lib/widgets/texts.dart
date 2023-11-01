import 'package:flutter/material.dart';

//Create reusable Text Widget

// ignore: must_be_immutable
class Texts extends StatelessWidget {
  // Declared text properties
  final String text;
  double size;
  final FontWeight fontWeight;
  TextDecoration? textDecoration;

  Texts({Key? key,  required this.text, required this.size, required this.fontWeight, this.textDecoration}) :super(key: key);

  


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
