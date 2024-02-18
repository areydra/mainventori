import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  void Function()? onPress;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double borderRadius;

  Button({
    Key? key,
    required this.onPress,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius = 8,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor ?? backgroundColor),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 20, horizontal: 26))),
      onPressed: onPress,
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
