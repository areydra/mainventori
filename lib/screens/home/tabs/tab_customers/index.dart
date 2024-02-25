import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_customers/widgets/content/index.dart';
import 'package:mainventori/screens/home/tabs/tab_customers/widgets/header/index.dart';

class TabCustomers extends StatefulWidget {
  const TabCustomers({Key? key}) : super(key: key);

  @override
  State<TabCustomers> createState() => _TabCustomersState();
}

class _TabCustomersState extends State<TabCustomers> {
  final database = AppDatabase();
  List<Customer> customers = [];
  int currentPageNumber = 0;
  int totalPageNumber = 0;
  int limitPerPage = 10;
  String searchQuery = '';

  Future<void> getItemsPerPage(int pageNumber, String query) async {
    List<Customer> fetchCustomers = await (database.select(database.customers)
          ..where((column) {
            return column.name.contains(query) |
                column.contactNumber.contains(query) |
                column.email.contains(query) |
                column.address.contains(query);
          })
          ..orderBy([
            (t) => drift.OrderingTerm(
                expression: t.id, mode: drift.OrderingMode.desc)
          ])
          ..limit(limitPerPage, offset: pageNumber * limitPerPage))
        .get();

    setState(() {
      customers = fetchCustomers;
      currentPageNumber = pageNumber;
    });
  }

  void searchCustomers(String query) {
    getItemsPerPage(0, query);
    getTotalRowCount();
    setState(() {
      searchQuery = query;
    });
  }

  getTotalRowCount() async {
    final int count = (await database.customers.count().get())[0];

    setState(() {
      totalPageNumber = ((count / limitPerPage).ceil());
    });
  }

  @override
  void initState() {
    super.initState();

    fetchDataCustomers();
  }

  void fetchDataCustomers() {
    getItemsPerPage(0, searchQuery);
    getTotalRowCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromRGBO(240, 241, 243, 1),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(children: [
          Header(
            refreshDataCustomers: fetchDataCustomers,
            searchCustomers: searchCustomers,
          ),
          Expanded(
            child: Content(
              customers: customers,
              currentPageNumber: currentPageNumber,
              totalPageNumber: totalPageNumber,
              searchQuery: searchQuery,
              getItemsPerPage: getItemsPerPage,
            ),
          ),
        ]),
      ),
    );
  }
}
