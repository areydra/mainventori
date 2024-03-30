import 'package:flutter/material.dart';

class SeparatorVertical extends StatelessWidget {
  final double height;

  const SeparatorVertical({
    Key? key,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: height,
      color: const Color.fromRGBO(240, 241, 243, 1),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}
