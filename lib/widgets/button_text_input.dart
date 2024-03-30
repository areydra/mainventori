import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonTextInput extends StatelessWidget {
  void Function()? onPress;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final bool? isError;

  ButtonTextInput({
    Key? key,
    required this.text,
    this.onPress,
    this.backgroundColor = Colors.white,
    this.textColor = const Color.fromRGBO(133, 141, 157, 1),
    this.borderRadius = 8,
    this.borderColor = const Color.fromRGBO(133, 141, 157, 1),
    this.isError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          side: BorderSide(
            color: isError! ? const Color.fromRGBO(189, 0, 0, 1) : borderColor!,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 22,
          horizontal: 16,
        ),
        fixedSize: const Size.fromWidth(130),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPress,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: textColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
