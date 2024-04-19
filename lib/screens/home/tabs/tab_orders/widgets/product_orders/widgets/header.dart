import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/add_new_order_dialog/index.dart';
import 'package:mainventori/widgets/button.dart';

class ProductOrdersHeader extends StatefulWidget {
  final Function searchDataOrders;
  final Function getOrdersData;

  const ProductOrdersHeader({
    Key? key,
    required this.searchDataOrders,
    required this.getOrdersData,
  }) : super(key: key);

  @override
  State<ProductOrdersHeader> createState() => _ProductOrdersHeaderState();
}

class _ProductOrdersHeaderState extends State<ProductOrdersHeader> {
  TextEditingController textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Orders',
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
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/search.png'),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            hintText: 'Search customer or product',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              height: 2.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          controller: textSearchController,
                          onEditingComplete: () {
                            widget.searchDataOrders(textSearchController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Button(
                onPress: () => {
                  SmartDialog.show(builder: (_) {
                    return AddNewOrderDialog(
                      refreshDataOrders: widget.getOrdersData,
                    );
                  })
                },
                text: 'Add Order',
                backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
