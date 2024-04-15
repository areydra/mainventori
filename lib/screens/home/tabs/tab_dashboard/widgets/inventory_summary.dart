import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';

class InventorySummary extends StatefulWidget {
  const InventorySummary({Key? key}) : super(key: key);

  @override
  State<InventorySummary> createState() => _InventorySummaryState();
}

class _InventorySummaryState extends State<InventorySummary> {
  int quantityInHand = 0;
  int quantitySold = 0;

  @override
  void initState() {
    super.initState();

    AppDatabase().salesSummaryDao.getCurrentSalesSummary().then((value) {
      setState(() {
        quantityInHand = value.quantityInHand;
        quantitySold = value.quantitySold;
      });
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
            child: const Text(
              'Inventory Summary',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(children: [
                        Image(
                          image: AssetImage('assets/icons/quantity.png'),
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Quantity in Hand',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    Text(
                      quantityInHand.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(children: [
                        Image(
                          image: AssetImage('assets/icons/sold.png'),
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Sold',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    Text(
                      quantitySold.toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
