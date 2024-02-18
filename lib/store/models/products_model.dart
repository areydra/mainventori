import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';

class ProductsModel extends ChangeNotifier {
  List<Product> products = [];

  ProductsModel({
    required this.products,
  });

  void addProducts(Product product) {
    products.add(product);
    notifyListeners();
  }

  void editProduct(int index, Product product) {
    products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}
