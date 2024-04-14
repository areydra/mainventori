import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/models/orders_model.dart';
import 'package:mainventori/store/models/products_model.dart';
import 'package:mainventori/store/models/user.dart';

final productsStore = ChangeNotifierProvider<ProductsModel>((ref) {
  return ProductsModel(products: []);
});

final ordersStore = ChangeNotifierProvider<OrdersModel>((ref) {
  return OrdersModel();
});

final userStore = ChangeNotifierProvider<UserModel>((ref) {
  return UserModel();
});
