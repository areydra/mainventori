import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/models/order_list_controller.dart';
import 'package:mainventori/utils/times.dart';

class OrdersModel extends ChangeNotifier {
  final database = AppDatabase();

  bool isSaving = false;
  bool isSaved = false;
  List<OrderListController> orders = [];
  List<List<String>> ordersListError = [];
  TextEditingController textControllerDeliveryDate = TextEditingController();
  TextEditingController textControllerCustomer = TextEditingController();
  TextEditingController textControllerTotalOrdersSellingPrice =
      TextEditingController();
  TextEditingController textControllerTotalOrdersBuyingPrice =
      TextEditingController();
  List<Product> initialProductList = [];
  int initialTotalProductPage = 0;
  bool isEmptyDeliveryDate = false;
  bool isEmptyCustomer = false;

  void initialize() {
    orders = [
      OrderListController(
        code: TextEditingController(),
        name: TextEditingController(),
        price: TextEditingController(),
        sellingPrice: TextEditingController(),
        quantity: TextEditingController(),
        isError: false,
        quantityLeft: 0,
        productId: 0,
      )
    ];
    ordersListError = [
      [
        'code',
        'name',
        'price',
        'sellingPrice',
        'quantity',
      ]
    ];

    isSaving = false;
    textControllerCustomer.text = '';
    textControllerDeliveryDate.text = '';
    textControllerTotalOrdersSellingPrice.text = '';
    textControllerTotalOrdersBuyingPrice.text = '';
    isEmptyCustomer = false;
    isEmptyDeliveryDate = false;

    database.productsDao.getItemsPerPage(0, 10).then((value) {
      initialProductList = value.products;
    });

    database.productsDao.getTotalRowCount(10).then((value) {
      initialTotalProductPage = value;
    });

    notifyListeners();
  }

  void onChangeDeliveryDate(String value) {
    textControllerDeliveryDate.text = value;
    isEmptyDeliveryDate = value.isEmpty;
    notifyListeners();
  }

  void onChangeTotalOrdersPrice(String sellingPrice, String buyingPrice) {
    textControllerTotalOrdersSellingPrice.text = sellingPrice;
    textControllerTotalOrdersBuyingPrice.text = buyingPrice;
  }

  void onChangeCustomer(String value) {
    textControllerCustomer.text = value;
    isEmptyCustomer = value.isEmpty;
    notifyListeners();
  }

  void addOrder() {
    orders.add(OrderListController(
      code: TextEditingController(),
      name: TextEditingController(),
      price: TextEditingController(),
      sellingPrice: TextEditingController(),
      quantity: TextEditingController(),
      isError: false,
      quantityLeft: 0,
      productId: 0,
    ));
    ordersListError.add([
      'code',
      'name',
      'price',
      'sellingPrice',
      'quantity',
    ]);
    notifyListeners();
  }

  void deleteOrder(int index) {
    orders.removeAt(index);
    ordersListError.removeAt(index);
    notifyListeners();
  }

  void onSelectProduct(int index, Product product) {
    orders[index].code.text = product.code;
    orders[index].name.text = product.name;
    orders[index].price.text = product.buyingPrice.toString();
    orders[index].quantityLeft = product.quantity;
    orders[index].productId = product.id;

    onChangeValue(index, "code");
    onChangeValue(index, "name");
    onChangeValue(index, "price");
    notifyListeners();
  }

  void onChangeValue(int index, String key) {
    switch (key) {
      case 'code':
        if (orders[index].code.text.isEmpty) {
          if (!ordersListError[index].contains('code')) {
            ordersListError[index].add('code');
          }
        } else {
          if (ordersListError[index].contains('code')) {
            ordersListError[index].remove('code');
          }
        }
        break;
      case 'name':
        if (orders[index].name.text.isEmpty) {
          if (!ordersListError[index].contains('name')) {
            ordersListError[index].add('name');
          }
        } else {
          if (ordersListError[index].contains('name')) {
            ordersListError[index].remove('name');
          }
        }
        break;
      case 'price':
        if (orders[index].price.text.isEmpty) {
          if (!ordersListError[index].contains('price')) {
            ordersListError[index].add('price');
          }
        } else {
          if (ordersListError[index].contains('price')) {
            ordersListError[index].remove('price');
          }
        }
        break;
      case 'sellingPrice':
        if (orders[index].sellingPrice.text.isEmpty) {
          if (!ordersListError[index].contains('sellingPrice')) {
            ordersListError[index].add('sellingPrice');
          }
        } else {
          if (ordersListError[index].contains('sellingPrice')) {
            ordersListError[index].remove('sellingPrice');
          }
        }
        break;
      case 'quantity':
        if (orders[index].quantity.text.isEmpty) {
          if (!ordersListError[index].contains('quantity')) {
            ordersListError[index].add('quantity');
          }
        } else {
          if (ordersListError[index].contains('quantity')) {
            ordersListError[index].remove('quantity');
          }
        }
        break;
    }

    notifyListeners();
  }

  bool validation() {
    bool isFieldValid = true;

    for (int index = 0; index < ordersListError.length; index++) {
      var value = ordersListError[index];
      if (value.isNotEmpty && isFieldValid) {
        isFieldValid = false;
      }

      if (value.isNotEmpty && !orders[index].isError) {
        orders[index].isError = true;
      }
    }

    if (textControllerCustomer.text.isEmpty ||
        textControllerDeliveryDate.text.isEmpty) {
      isEmptyCustomer = textControllerCustomer.text.isEmpty;
      isEmptyDeliveryDate = textControllerDeliveryDate.text.isEmpty;
      isFieldValid = false;
    }

    return isFieldValid;
  }

  Future<bool> saveToDatabase() async {
    isSaving = true;
    isSaved = false;

    if (!validation()) {
      isSaving = false;
      notifyListeners();
      return isSaved;
    }

    List<OrdersListCompanion> ordersListCompanion = [];
    DateFormat dateFormat = DateFormat("dd MMMM yyyy");
    DateTime currentDate = DateTime.now();

    final insertedId =
        await database.into(database.orders).insert(OrdersCompanion.insert(
              productName: orders[0].name.text,
              productQuantity: int.parse(orders[0].quantity.text),
              productSellingPrice: int.parse(orders[0].sellingPrice.text),
              totalOrdersQuantity: orders.length,
              totalOrdersSellingPrice:
                  int.parse(textControllerTotalOrdersSellingPrice.text),
              deliveryDate: dateFormat.parse(textControllerDeliveryDate.text),
              customer: textControllerCustomer.text,
              createdAt: currentDate,
            ));

    for (var value in orders) {
      ordersListCompanion.add(OrdersListCompanion(
        idOrders: Value(insertedId),
        productCode: Value(value.code.text),
        productName: Value(value.name.text),
        originalPrice: Value(int.parse(value.price.text)),
        sellingPrice: Value(int.parse(value.sellingPrice.text)),
        quantity: Value(int.parse(value.quantity.text)),
        createdAt: Value(currentDate),
      ));
    }

    await database.batch((batch) {
      batch.insertAll(database.ordersList, ordersListCompanion);
    }).then((_) async {
      isSaved = true;
      SmartDialog.dismiss();
    }).catchError((error) async {
      SmartDialog.show(builder: (context) {
        return Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Maaf, sistem sedang gangguan!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      });
    }).whenComplete(() {
      isSaving = false;
      notifyListeners();
    });

    if (isSaved) {
      CurrentDate currentDate = getCurrentDate();
      int quantitySold = 0;

      for (var index = 0; index < orders.length; index++) {
        database.update(database.products)
          ..where((tbl) => tbl.code.equals(orders[index].code.text))
          ..write(ProductsCompanion(
              quantity: Value(orders[index].quantityLeft -
                  int.parse(orders[index].quantity.text))));

        database.topSellingStockDao.setItem(TopSellingStockData(
          id: 0,
          idProduct: orders[index].productId,
          quantitySold: int.parse(orders[index].quantity.text),
          month: currentDate.month,
          year: currentDate.year,
        ));

        quantitySold += int.parse(orders[index].quantity.text);
      }

      database.salesSummaryDao.setCurrentSalesSummary(SalesSummaryData(
        id: 0,
        revenue: int.parse(textControllerTotalOrdersSellingPrice.text),
        cost: int.parse(textControllerTotalOrdersBuyingPrice.text),
        quantityInHand: 0,
        quantitySold: quantitySold,
        month: currentDate.month,
        year: currentDate.year,
      ));
    }

    return isSaved;
  }
}
