import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/daos/orders.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/add_new_order_dialog/index.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

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

List<ProductsOrdersStock> products = [
  ProductsOrdersStock(
    name: 'Aqua 600ml',
    orderValue: 43500,
    quantity: 20,
    orderId: 1,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Aqua 1500ml',
    orderValue: 48500,
    quantity: 20,
    orderId: 2,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Robusta',
    orderValue: 17500,
    quantity: 20,
    orderId: 3,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Okky Jelly Drink',
    orderValue: 19000,
    quantity: 20,
    orderId: 4,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Teh Rio',
    orderValue: 18500,
    quantity: 20,
    orderId: 5,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
  ProductsOrdersStock(
    name: 'Teh Gelas',
    orderValue: 18500,
    quantity: 0,
    orderId: 6,
    expectedDelivery: '11/12/24',
    unit: 'carton',
  ),
];

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

  TextEditingController textSearchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getOrdersData(currentPageNumber, searchQuery);
  }

  Future<void> getOrdersData(currentPageNumber, searchQuery) async {
    DaosGetItemsPerPage fetchOrders = await database.ordersDao
        .getItemsPerPage(currentPageNumber, limitPerPage, searchQuery);

    int fetchTotalPageNumber =
        await database.ordersDao.getTotalRowCount(limitPerPage, searchQuery);

    setState(() {
      orders = fetchOrders.orders;
      currentPageNumber = fetchOrders.currentPageNumber;
      totalPageNumber = fetchTotalPageNumber;
    });
  }

  void searchDataOrders(String query) {
    getOrdersData(0, query);
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Orders',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 320,
                      height: 44,
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color.fromRGBO(240, 241, 243, 1)),
                        ),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/icons/search.png'),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  hintText: 'Search customer or product',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    height: 2.8,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                controller: textSearchController,
                                onEditingComplete: () {
                                  searchDataOrders(textSearchController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(19, 102, 217, 1)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 26))),
                        onPressed: () {
                          SmartDialog.show(builder: (_) {
                            return AddNewOrderDialog(refreshDataOrders: () {});
                          });
                        },
                        child: const Text(
                          'Add Order',
                          style: TextStyle(fontSize: 14),
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SeparatorHorizontal(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    'ID',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    'Customer',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    'Produk',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Text(
                    'Total Belanja',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Text(
                    'Tanggal Pengiriman',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SeparatorHorizontal(),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Text(
                              orders[index].id.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              orders[index].customer,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orders[index].productName,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(72, 80, 94, 1),
                                      fontWeight: FontWeight.w500),
                                ),
                                Visibility(
                                  visible:
                                      (orders[index].totalOrdersQuantity - 1) >
                                          0,
                                  child: Text(
                                    '+${(orders[index].totalOrdersQuantity - 1).toString()} product lainnya.',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color.fromRGBO(72, 80, 94, 1),
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Rp${NumberFormat.decimalPattern('id').format(orders[index].totalOrdersSellingPrice)}',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              DateFormat('dd MMMM yyyy')
                                  .format(orders[index].deliveryDate),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: index < (products.length - 1),
                      child: const SeparatorHorizontal(),
                    )
                  ],
                );
              },
            ),
          ),
          Footer(
              currentPage: currentPageNumber,
              totalPage: totalPageNumber,
              onPressNextPage: () {
                if ((currentPageNumber + 1) < totalPageNumber) {
                  getOrdersData(currentPageNumber + 1, searchQuery);
                }
              },
              onPressPreviousPage: () {
                if (currentPageNumber > 0) {
                  getOrdersData(currentPageNumber - 1, searchQuery);
                }
              }),
        ],
      ),
    );
  }
}
