import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/utils/index.dart';
import 'package:mainventori/widgets/separator_vertical.dart';

class HeaderInventory extends StatefulWidget {
  const HeaderInventory({Key? key}) : super(key: key);

  @override
  State<HeaderInventory> createState() => _HeaderInventoryState();
}

class _HeaderInventoryState extends State<HeaderInventory> {
  int totalProducts = 0;
  int totalLowStockProducts = 0;

  @override
  void initState() {
    super.initState();

    try {
      getOverallProducts().then((value) {
        setState(() {
          totalProducts = value.totalProducts;
          totalLowStockProducts = value.totalLowProducts;
        });
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overall Inventory',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Products',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(225, 145, 51, 1),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            totalProducts.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(93, 102, 121, 1),
                            ),
                          )
                        ],
                      )),
                  const SeparatorVertical(),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Low Stocks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(243, 105, 96, 1),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          totalLowStockProducts.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(93, 102, 121, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
