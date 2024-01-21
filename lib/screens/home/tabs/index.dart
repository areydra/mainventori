import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_dashboard/index.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:mainventori/screens/home/tabs/tab_customers.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/index.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/index.dart';
import 'package:mainventori/screens/home/tabs/tab_settings.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers.dart';

class Tabs extends StatelessWidget {
  final SidebarXController controller;

  const Tabs({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            switch (controller.selectedIndex) {
              case 0:
                return const TabDashboard();
              case 1:
                return const TabInventory();
              case 2:
                return const TabOrders();
              case 3:
                return const TabSuppliers();
              case 4:
                return const TabCustomers();
              case 5:
                return const TabSettings();
              default:
                return Text(
                  'Not found page',
                  style: Theme.of(context).textTheme.headlineSmall,
                );
            }
          },
        ),
      ),
    );
  }
}
