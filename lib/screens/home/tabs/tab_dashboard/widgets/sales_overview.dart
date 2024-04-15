import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/separator_vertical.dart';

class SalesOverview extends StatefulWidget {
  const SalesOverview({Key? key}) : super(key: key);

  @override
  State<SalesOverview> createState() => _SalesOverviewState();
}

class _SalesOverviewState extends State<SalesOverview> {
  int revenue = 0;
  int cost = 0;
  int profit = 0;

  @override
  void initState() {
    super.initState();

    AppDatabase().salesSummaryDao.getCurrentSalesSummary().then((value) {
      setState(() {
        revenue = value.revenue;
        cost = value.cost;
        profit = value.revenue - value.cost;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      margin: const EdgeInsets.only(right: 22),
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
              'Sales Overview',
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
                          image: AssetImage('assets/icons/revenue.png'),
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Revenue',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    Text(
                      'Rp${NumberFormat.decimalPattern('id').format(revenue)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(children: [
                        Image(
                          image: AssetImage('assets/icons/cost.png'),
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Cost',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    Text(
                      'Rp${NumberFormat.decimalPattern('id').format(cost)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(children: [
                        Image(
                          image: AssetImage('assets/icons/profit.png'),
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Profit',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ]),
                    ),
                    Text(
                      'Rp${NumberFormat.decimalPattern('id').format(profit)}',
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
