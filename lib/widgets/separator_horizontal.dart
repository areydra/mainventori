import 'package:flutter/material.dart';

class SeparatorHorizontal extends StatelessWidget {
  const SeparatorHorizontal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: 1,
      color: const Color.fromRGBO(240, 241, 243, 1),
    );
  }
}