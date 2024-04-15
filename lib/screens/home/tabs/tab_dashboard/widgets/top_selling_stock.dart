import 'package:flutter/material.dart';
import 'package:mainventori/database/daos/top_selling_stock.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:intl/intl.dart';

class TopSellingStock extends StatefulWidget {
  const TopSellingStock({super.key});

  @override
  State<TopSellingStock> createState() => _TopSellingStockState();
}

class _TopSellingStockState extends State<TopSellingStock> {
  List<TopSellingStockWithProductDetails> products = [
    TopSellingStockWithProductDetails(
      id: 0,
      idProduct: 0,
      quantitySold: 0,
      month: '',
      year: '',
      price: 0,
      quantity: 0,
      name: '',
    )
  ];

  @override
  void initState() {
    super.initState();

    AppDatabase().topSellingStockDao.getItems().then((value) {
      setState(() {
        products = value.topSellingStockList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Top Selling Stock',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(15, 80, 170, 1)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SeparatorHorizontal(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1)),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(
                    child: Text(
                      'Sold Quantity',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(93, 102, 121, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(
                    child: Text(
                      'Remaining Quantity',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(93, 102, 121, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(
                    child: Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(93, 102, 121, 1)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SeparatorHorizontal(),
          Expanded(
              child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Visibility(
                visible: products[index].id != 0,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              products[index].name,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(93, 102, 121, 1)),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(
                              child: Text(
                                products[index].quantitySold.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(93, 102, 121, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(
                              child: Text(
                                products[index].quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(93, 102, 121, 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(
                              child: Text(
                                'Rp${NumberFormat.decimalPattern('id').format(products[index].price)}',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(93, 102, 121, 1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SeparatorHorizontal(),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
