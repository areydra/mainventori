import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers/widgets/suppliers.dart';

class TabSuppliers extends StatelessWidget {
  const TabSuppliers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(240, 241, 243, 1),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      child: const Column(
        children: [
          SizedBox(height: 22),
          Expanded(child: Suppliers()),
        ],
      ),
    );
  }
}
