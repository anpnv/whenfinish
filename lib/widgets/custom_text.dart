import 'package:flutter/material.dart';
import 'package:whenfinish/utils/constants.dart';

class CustomText extends StatelessWidget {
  final String firstPart;
  final String secondPart;
  final double fontSize;
  const CustomText(
      {Key? key,
      required this.firstPart,
      required this.secondPart,
      this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstPart.toUpperCase(),
        style: TextStyle(
          color: secondary,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: secondPart,
            style: TextStyle(
              color: white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
