import 'package:flutter/material.dart';

class SeparatorVertical extends StatelessWidget {
const SeparatorVertical({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 1,
      height: 80,
      color: const Color.fromRGBO(240, 241, 243, 1),
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}