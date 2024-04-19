import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/database/daos/orders.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/product_orders/widgets/content_data.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/product_orders/widgets/content_header.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/product_orders/widgets/header.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductsOrdersStock {
  String name;
  int orderValue;
  int quantity;
  int orderId;
  String expectedDelivery;
  String unit;

  ProductsOrdersStock({
    required this.name,
    required this.orderValue,
    required this.quantity,
    required this.orderId,
    required this.expectedDelivery,
    required this.unit,
  });
}

class ProductsOrders extends ConsumerStatefulWidget {
  const ProductsOrders({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductsOrders> createState() => _ProductsOrdersState();
}

class _ProductsOrdersState extends ConsumerState<ProductsOrders> {
  final database = AppDatabase();
  List<Order> orders = [];
  int currentPageNumber = 0;
  int totalPageNumber = 0;
  int limitPerPage = 10;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    getOrdersData(
      pageNumber: currentPageNumber,
      query: searchQuery,
    );
  }

  Future<void> getOrdersData({int pageNumber = 0, String query = ''}) async {
    DaosGetItemsPerPage fetchOrders = await database.ordersDao
        .getItemsPerPage(pageNumber, limitPerPage, query);

    int fetchTotalPageNumber =
        await database.ordersDao.getTotalRowCount(limitPerPage, query);

    setState(() {
      orders = fetchOrders.orders;
      currentPageNumber = fetchOrders.currentPageNumber;
      totalPageNumber = fetchTotalPageNumber;
    });
  }

  void searchDataOrders(String query) {
    getOrdersData(pageNumber: 0, query: query);
    setState(() {
      searchQuery = query;
    });
  }

  void onPressNextPage() {
    int newPageNumber = currentPageNumber + 1;

    if (newPageNumber == totalPageNumber) {
      return;
    }

    getOrdersData(pageNumber: newPageNumber, query: searchQuery);
  }

  void onPressPreviousPage() {
    int newPageNumber = currentPageNumber - 1;

    if (newPageNumber < 0) {
      return;
    }

    getOrdersData(pageNumber: newPageNumber, query: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          ProductOrdersHeader(
            searchDataOrders: searchDataOrders,
            getOrdersData: getOrdersData,
          ),
          const SeparatorHorizontal(),
          const SizedBox(height: 15),
          const ProductOrdersContentHeader(),
          const SizedBox(height: 15),
          const SeparatorHorizontal(),
          ProductOrdersContentData(orders: orders),
          Footer(
            currentPage: currentPageNumber,
            totalPage: totalPageNumber,
            onPressNextPage: onPressNextPage,
            onPressPreviousPage: onPressPreviousPage,
          ),
        ],
      ),
    );
  }
}
