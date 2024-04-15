import 'package:flutter/widgets.dart';

class OrderListController {
  late TextEditingController code;
  late TextEditingController name;
  late TextEditingController price;
  late TextEditingController sellingPrice;
  late TextEditingController quantity;
  late bool isError;
  late int quantityLeft;
  late int productId;

  OrderListController({
    required this.code,
    required this.name,
    required this.price,
    required this.sellingPrice,
    required this.quantity,
    required this.isError,
    required this.quantityLeft,
    required this.productId,
  });
}
