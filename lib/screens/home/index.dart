import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:mainventori/screens/home/tabs/index.dart';
import 'package:mainventori/screens/home/widgets/sidebar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(controller: _controller),
          Tabs(controller: _controller)
        ],
      ),
    );
  }
}
