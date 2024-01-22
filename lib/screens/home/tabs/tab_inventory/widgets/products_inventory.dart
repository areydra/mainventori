import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/dialog_product_fields.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ProductsInventoryStock {
  String name;
  int buyingPrice;
  int quantity;
  int thresholdVlue;
  String expiryDate;
  String unit;

  ProductsInventoryStock({
    required this.name,
    required this.buyingPrice,
    required this.quantity,
    required this.thresholdVlue,
    required this.expiryDate,
    required this.unit,
  });
}

List<ProductsInventoryStock> products = [
  ProductsInventoryStock(
    name: 'Aqua 600ml',
    buyingPrice: 43500,
    quantity: 20,
    thresholdVlue: 10,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
  ProductsInventoryStock(
    name: 'Aqua 1500ml',
    buyingPrice: 48500,
    quantity: 20,
    thresholdVlue: 10,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
  ProductsInventoryStock(
    name: 'Robusta',
    buyingPrice: 17500,
    quantity: 20,
    thresholdVlue: 10,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
  ProductsInventoryStock(
    name: 'Okky Jelly Drink',
    buyingPrice: 19000,
    quantity: 20,
    thresholdVlue: 10,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
  ProductsInventoryStock(
    name: 'Teh Rio',
    buyingPrice: 18500,
    quantity: 20,
    thresholdVlue: 11,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
  ProductsInventoryStock(
    name: 'Teh Gelas',
    buyingPrice: 18500,
    quantity: 0,
    thresholdVlue: 10,
    expiryDate: '11/12/24',
    unit: 'carton',
  ),
];

class ProductsInventory extends StatelessWidget {
  const ProductsInventory({Key? key}) : super(key: key);

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
                            return const DialogProductFields();
                          });
                        },
                        child: const Text(
                          'Add Product',
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
                    'Buying Price',
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
                  width: 120,
                  child: Text(
                    'Threshold Value',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Expiry Date',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'Availability',
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
                              'Rp${NumberFormat.decimalPattern('id').format(products[index].buyingPrice)}',
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
                            width: 120,
                            child: Text(
                              '${products[index].thresholdVlue} ${products[index].unit}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Text(
                              products[index].expiryDate,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: products[index].quantity == 0
                                ? const Text(
                                    'Out of stock',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(218, 62, 51, 1),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : products[index].quantity < 10
                                    ? const Text(
                                        'Low stock',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(225, 145, 51, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : const Text(
                                        'In stock',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromRGBO(16, 167, 96, 1),
                                          fontWeight: FontWeight.w500,
                                        ),
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
