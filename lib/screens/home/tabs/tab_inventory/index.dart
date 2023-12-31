import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/overall_inventory.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/products_inventory.dart';

class TabInventory extends StatelessWidget {
  const TabInventory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(240, 241, 243, 1),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      child: const Column(
        children: [
          Row(
            children: [
              OverallInventory(),
            ],
          ),
          SizedBox(height: 22),
          Expanded(child: ProductsInventory()),
        ],
      ),
    );
  }
}
