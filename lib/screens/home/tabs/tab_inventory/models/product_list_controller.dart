import 'package:flutter/widgets.dart';

class ProductListController {
  late TextEditingController code;
  late TextEditingController name;
  late TextEditingController category;
  late TextEditingController supplier;
  late TextEditingController buyingPrice;
  late TextEditingController quantity;
  late TextEditingController unit;
  late TextEditingController dateIn;
  late TextEditingController minStock;

  ProductListController({
    required this.code,
    required this.name,
    required this.category,
    required this.supplier,
    required this.buyingPrice,
    required this.quantity,
    required this.unit,
    required this.dateIn,
    required this.minStock,
  });
}
