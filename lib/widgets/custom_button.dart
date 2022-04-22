import 'package:flutter/material.dart';
import 'package:whenfinish/utils/constants.dart';

class CustomButton extends StatelessWidget {
  final Function() press;
  final String txtButton;
  const CustomButton({Key? key, required this.press, required this.txtButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: lightBlue,
          splashColor: lightBlue,
          borderRadius: BorderRadius.circular(20),
          onTap: press,
          child: Center(
            child: Text(
              txtButton.toUpperCase(),
              style: TextStyle(
                  color: white, fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
