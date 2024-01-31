import 'package:drift/drift.dart' as drift;
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
  int limitPerPage = 10;

  Future<void> getItemsPerPage(int pageNumber) async {
    List<Product> fetchedProducts = await (database.select(database.products)
          ..orderBy([
            (t) => drift.OrderingTerm(
                expression: t.id, mode: drift.OrderingMode.desc)
          ])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    setState(() {
      products = fetchedProducts;
      currentPageNumber = pageNumber;
    });
  }

  Future<void> addNewProduct(Product product) async {
    List<Product> newProducts = [product, ...products];

    if (newProducts.length > limitPerPage) {
      newProducts.removeLast();
    }

    setState(() {
      products = newProducts;
    });
  }

  getTotalRowCount() async {
    final int count = (await database.products.count().get())[0];

    setState(() {
      totalPageNumber = ((count / limitPerPage).ceil());
    });
  }

  @override
  void initState() {
    super.initState();

    getItemsPerPage(0);
    getTotalRowCount();
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
          Header(addNewProduct: addNewProduct),
          const ProductListHeader(),
          ProductsListContent(products: products),
          Footer(
              currentPage: currentPageNumber,
              totalPage: totalPageNumber,
              onPressNextPage: () {
                if ((currentPageNumber + 1) < totalPageNumber) {
                  getItemsPerPage(currentPageNumber + 1);
                }
              },
              onPressPreviousPage: () {
                if (currentPageNumber > 0) {
                  getItemsPerPage(currentPageNumber - 1);
                }
              }),
        ],
      ),
    ));
  }
}
