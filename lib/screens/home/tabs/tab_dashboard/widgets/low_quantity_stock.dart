import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/card_with_image.dart';
import 'package:drift/drift.dart' as drift;

class LowQuantityStock extends StatefulWidget {
  const LowQuantityStock({Key? key}) : super(key: key);

  @override
  State<LowQuantityStock> createState() => _LowQuantityStockState();
}

class _LowQuantityStockState extends State<LowQuantityStock> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    getItemsPerPage();
  }

  Future<void> getItemsPerPage() async {
    int pageNumber = 0;
    int limitPerPage = 10;
    final database = AppDatabase();

    List<Product> fetchedProducts = await (database.select(database.products)
          ..where((column) {
            return column.quantity.isSmallerOrEqual(column.minStock);
          })
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    database.close();

    setState(() {
      products = fetchedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 22),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Low Quantity Stock',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  CardWithImage(
                    title: products[index].name,
                    description:
                        'Remaining Quantity: ${products[index].quantity} ${products[index].unit}',
                    isShowStatus: products[index].quantity > 0,
                  ),
                  const SizedBox(height: 16),
                ]);
              },
            ),
          )
        ],
      ),
    );
  }
}
