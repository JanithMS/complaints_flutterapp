import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String buttonText;
  final Color textColor;

  CustomButton({
    this.onPressed,
    this.color,
    this.buttonText,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(5)),
        color: color,
        textColor: textColor,
        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
        child: Center(child: Text(buttonText)));
  }
}
