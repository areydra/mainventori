import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/header.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/products_list_content.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/products_list_header.dart';

class ContentInventory extends StatefulWidget {
  const ContentInventory({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContentInventoryState createState() => _ContentInventoryState();
}

class _ContentInventoryState extends State<ContentInventory> {
  final database = AppDatabase();
  List<Product> products = [];
  int currentPageNumber = 0;
  int totalPageNumber = 0;
  int limitPerPage = 8;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    getItemsPerPage(pageNumber: 0, query: searchQuery);
  }

  void getItemsPerPage({int pageNumber = 0, String query = ''}) {
    database.productsDao
        .getItemsPerPage(pageNumber, limitPerPage, query)
        .then((value) {
      setState(() {
        products = value.products;
        currentPageNumber = value.currentPageNumber;
      });
    });

    database.productsDao.getTotalRowCount(limitPerPage).then((value) {
      setState(() {
        totalPageNumber = value;
      });
    });
  }

  void searchDataProducts(String query) {
    database.productsDao.searchDataProducts(limitPerPage, query).then((value) {
      setState(() {
        products = value.products;
        currentPageNumber = value.currentPageNumber;
        totalPageNumber = value.totalPageNumber;
      });
    });
  }

  void onPressNextPage() {
    int newPageNumber = currentPageNumber + 1;

    if (newPageNumber == totalPageNumber) {
      return;
    }

    getItemsPerPage(pageNumber: newPageNumber, query: searchQuery);
  }

  void onPressPreviousPage() {
    int newPageNumber = currentPageNumber - 1;

    if (newPageNumber < 0) {
      return;
    }

    getItemsPerPage(pageNumber: newPageNumber, query: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Header(
            refreshDataProducts: getItemsPerPage,
            searchDataProducts: searchDataProducts,
          ),
          const ProductListHeader(),
          ProductsListContent(
            products: products,
            refreshDataProducts: getItemsPerPage,
          ),
          Footer(
            currentPage: currentPageNumber,
            totalPage: totalPageNumber,
            onPressNextPage: onPressNextPage,
            onPressPreviousPage: onPressPreviousPage,
          ),
        ],
      ),
    ));
  }
}
