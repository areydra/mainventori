import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';

class OverallOrders extends StatefulWidget {
  const OverallOrders({Key? key}) : super(key: key);

  @override
  State<OverallOrders> createState() => _OverallOrdersState();
}

class _OverallOrdersState extends State<OverallOrders> {
  int totalOrders = 0;

  @override
  void initState() {
    super.initState();

    final database = AppDatabase();
    database.ordersDao.getAllItems().then((value) {
      setState(() {
        totalOrders = value.length;
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall Orders',
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
                        'Total Orders',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(21, 112, 239, 1),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        totalOrders.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(93, 102, 121, 1),
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
