import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/models/products_model.dart';

final productsStore = ChangeNotifierProvider<ProductsModel>((ref) {
  return ProductsModel(products: []);
});
