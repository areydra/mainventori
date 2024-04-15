import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/index.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends ConsumerWidget {
  final SidebarXController controller;

  const Sidebar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SidebarX(
      controller: controller,
      theme: const SidebarXTheme(
        textStyle: TextStyle(color: Color.fromRGBO(93, 102, 121, 1)),
        selectedTextStyle: TextStyle(color: Color.fromRGBO(21, 112, 239, 1)),
        itemTextPadding: EdgeInsets.only(left: 30),
        selectedItemTextPadding: EdgeInsets.only(left: 30),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(93, 102, 121, 1),
          size: 20,
        ),
        selectedIconTheme: IconThemeData(
          color: Color.fromRGBO(21, 112, 239, 1),
          size: 20,
        ),
        hoverTextStyle: TextStyle(color: Color.fromRGBO(21, 112, 239, 1)),
        itemMargin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        selectedItemMargin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      extendedTheme: const SidebarXTheme(
        width: 280,
        decoration: BoxDecoration(color: Colors.white),
      ),
      showToggleButton: false,
      headerBuilder: (context, extended) {
        return SizedBox(
          width: 232,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Dashboard',
          onTap: () {
            debugPrint('Hello');
          },
        ),
        const SidebarXItem(
          icon: Icons.inventory,
          label: 'Inventory',
        ),
        const SidebarXItem(
          icon: Icons.shop_2,
          label: 'Orders',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Suppliers',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'Customers',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
            ref.read(userStore.notifier).removeUser();
          },
        ),
      ],
    );
  }
}
