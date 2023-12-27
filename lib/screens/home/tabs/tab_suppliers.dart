import 'package:flutter/material.dart';

class TabSuppliers extends StatelessWidget {
  const TabSuppliers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(240, 241, 243, 1),
      child: const Text('Suppliers'),
    );
  }
}
