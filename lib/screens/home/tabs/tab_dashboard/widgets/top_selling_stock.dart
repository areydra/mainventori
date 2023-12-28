import 'package:flutter/material.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:intl/intl.dart';

class ProductTopSellingStock{
  String name;
  int sold;
  int remaining;
  int price;

  ProductTopSellingStock({
    required this.name,
    required this.sold,
    required this.remaining,
    required this.price,
  });
}

List<ProductTopSellingStock> products = [
  ProductTopSellingStock(name: 'Aqua 600ml', sold: 10, remaining: 20, price: 43500),
  ProductTopSellingStock(name: 'Aqua 1500ml', sold: 10, remaining: 20, price: 48500),
  ProductTopSellingStock(name: 'Robusta', sold: 10, remaining: 50, price: 17500),
  ProductTopSellingStock(name: 'Oky Jelly Drink', sold: 10, remaining: 20, price: 19000),
  ProductTopSellingStock(name: 'Teh Rio', sold: 10, remaining: 20, price: 18500),
  ProductTopSellingStock(name: 'Teh Gelas', sold: 10, remaining: 20, price: 18500),
];

class TopSellingStock extends StatelessWidget {
  const TopSellingStock({super.key});

  @override
  Widget build(BuildContext context){
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
                    fontSize: 14,
                    color: Color.fromRGBO(15, 80, 170, 1)
                  ),
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
                      color: Color.fromRGBO(93, 102, 121, 1)
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(child: 
                    Text(
                      'Sold Quantity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(child: 
                    Text(
                      'Remaining Quantity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Flexible(child: 
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SeparatorHorizontal(),
          Expanded(child: 
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Column(
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
                                color: Color.fromRGBO(93, 102, 121, 1)
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(child: 
                              Text(
                                products[index].sold.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(93, 102, 121, 1)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(child: 
                              Text(
                                products[index].remaining.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(93, 102, 121, 1)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: Flexible(child: 
                              Text(
                                'Rp${NumberFormat.decimalPattern('id').format(products[index].price)}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(93, 102, 121, 1)
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const SeparatorHorizontal(),
                  ],
                );
              },
            )
          )
        ],
      ),
    );
  }
}