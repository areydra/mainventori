import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/dialog_order_fields.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ProductsOrdersStock {
  String name;
  int orderValue;
  int quantity;
  int orderId;
  String expectedDelivery;
  String unit;

  ProductsOrdersStock({
    required this.name,
    required this.orderValue,
    required this.quantity,
    required this.orderId,
    required this.expectedDelivery,
    required this.unit,
  });
}

List<ProductsOrdersStock> products = [
  ProductsOrdersStock(
    name: 'Aqua 600ml',
    orderValue: 43500,
    quantity: 20,
    orderId: 1,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Aqua 1500ml',
    orderValue: 48500,
    quantity: 20,
    orderId: 2,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Robusta',
    orderValue: 17500,
    quantity: 20,
    orderId: 3,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Okky Jelly Drink',
    orderValue: 19000,
    quantity: 20,
    orderId: 4,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Teh Rio',
    orderValue: 18500,
    quantity: 20,
    orderId: 5,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Teh Gelas',
    orderValue: 18500,
    quantity: 0,
    orderId: 6,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
];

class ProductsOrders extends StatelessWidget {
  const ProductsOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Products',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 320,
                      height: 44,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(240, 241, 243, 1)),
                        ),
                        child: const Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/search.png'),
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search product',
                                    hintStyle:
                                        TextStyle(fontSize: 16, height: 2.8)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(19, 102, 217, 1)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 26))),
                        onPressed: () {
                          SmartDialog.show(builder: (_) {
                            return const DialogOrderFields();
                          });
                        },
                        child: const Text(
                          'Add Order',
                          style: TextStyle(fontSize: 14),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SeparatorHorizontal(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Products',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Order Value',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    'Quantity',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Order ID',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    'Expected Delivery',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SeparatorHorizontal(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              products[index].name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              'Rp${NumberFormat.decimalPattern('id').format(products[index].orderValue)}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              '${products[index].quantity} ${products[index].unit}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              '${products[index].orderId}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              products[index].expectedDelivery,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: index < (products.length - 1),
                      child: const SeparatorHorizontal(),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(208, 211, 217, 1)))),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(72, 80, 94, 1)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 26))),
                    onPressed: () {
                      // put your code here
                      // print("heello dere");
                    },
                    child: const Text(
                      'Previous',
                      style: TextStyle(fontSize: 14),
                    )),
                const Text('Page 1 of 10'),
                TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(208, 211, 217, 1)))),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(72, 80, 94, 1)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 26))),
                    onPressed: () {
                      // put your code here
                      // print("heello dere");
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
