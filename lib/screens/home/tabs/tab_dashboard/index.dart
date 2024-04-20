import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_dashboard/widgets/inventory_summary.dart';
import 'package:mainventori/screens/home/tabs/tab_dashboard/widgets/low_quantity_stock.dart';
import 'package:mainventori/screens/home/tabs/tab_dashboard/widgets/sales_overview.dart';
import 'package:mainventori/screens/home/tabs/tab_dashboard/widgets/top_selling_stock.dart';

class TabDashboard extends StatelessWidget {
  const TabDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(240, 241, 243, 1),
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 32),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(child: SalesOverview()),
              SizedBox(
                width: 356,
                child: InventorySummary(),
              )
            ],
          ),
          SizedBox(height: 22),
          Expanded(
            child: Row(
              children: [
                Expanded(child: TopSellingStock()),
                SizedBox(width: 22),
                SizedBox(
                  width: 356,
                  child: LowQuantityStock(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
