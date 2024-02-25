import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers/widgets/content/widgets/header.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers/widgets/content/widgets/supplier_list.dart';

class ContentSuppliers extends StatefulWidget {
  const ContentSuppliers({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContentSuppliers createState() => _ContentSuppliers();
}

class _ContentSuppliers extends State<ContentSuppliers> {
  final database = AppDatabase();
  List<Supplier> suppliers = [];
  int currentPageNumber = 0;
  int totalPageNumber = 0;
  int limitPerPage = 10;

  Future<void> getItemsPerPage(int pageNumber) async {
    List<Supplier> fetchSuppliers = await (database.select(database.suppliers)
          ..orderBy([
            (t) => drift.OrderingTerm(
                expression: t.id, mode: drift.OrderingMode.desc)
          ])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    setState(() {
      suppliers = fetchSuppliers;
      currentPageNumber = pageNumber;
    });
  }

  getTotalRowCount() async {
    final int count = (await database.suppliers.count().get())[0];

    setState(() {
      totalPageNumber = ((count / limitPerPage).ceil());
    });
  }

  @override
  void initState() {
    super.initState();

    fetchDataSuppliers();
  }

  void fetchDataSuppliers() {
    getItemsPerPage(0);
    getTotalRowCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        children: [
          Header(refreshDataSuppliers: fetchDataSuppliers),
          SupplierList(suppliers: suppliers),
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
            },
          ),
        ],
      ),
    );
  }
}
