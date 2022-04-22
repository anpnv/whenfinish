import 'package:flutter/material.dart';
import 'package:whenfinish/utils/constants.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'no '.toUpperCase(),
        style: TextStyle(
          color: lightBlue,
          fontSize: 50,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: 'overtime ',
            style: TextStyle(
              color: white,
              fontSize: 50,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: 'go home ',
            style: TextStyle(
              color: white,
              fontSize: 50,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: 'faster'.toUpperCase(),
            style: TextStyle(
              color: lightBlue,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
