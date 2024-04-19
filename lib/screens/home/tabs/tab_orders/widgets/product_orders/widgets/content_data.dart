import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/detail_orders_dialog.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductOrdersContentData extends StatelessWidget {
  final List<Order> orders;

  const ProductOrdersContentData({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: orders.length,
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
                      width: 50,
                      child: Text(
                        orders[index].id.toString(),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        orders[index].customer,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orders[index].productName,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(72, 80, 94, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          Visibility(
                            visible:
                                (orders[index].totalOrdersQuantity - 1) > 0,
                            child: Text(
                              '+${(orders[index].totalOrdersQuantity - 1).toString()} product lainnya.',
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Rp${NumberFormat.decimalPattern('id').format(orders[index].totalOrdersSellingPrice)}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        DateFormat('dd MMMM yyyy')
                            .format(orders[index].deliveryDate),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Button(
                        text: 'Details',
                        textColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(225, 131, 8, 1),
                        onPress: () {
                          SmartDialog.show(builder: (_) {
                            return DetailOrdersDialog(
                              order: orders[index],
                              refreshDataProducts: () {},
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: index < (orders.length - 1),
                child: const SeparatorHorizontal(),
              )
            ],
          );
        },
      ),
    );
  }
}
