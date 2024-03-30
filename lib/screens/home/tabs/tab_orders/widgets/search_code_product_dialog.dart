import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:mainventori/widgets/separator_vertical.dart';
import 'package:mainventori/widgets/text_input.dart';

class SearchCodeProductDialog extends ConsumerStatefulWidget {
  final int indexField;

  const SearchCodeProductDialog({
    Key? key,
    required this.indexField,
  }) : super(key: key);

  @override
  ConsumerState<SearchCodeProductDialog> createState() =>
      _SearchCodeProductDialogState();
}

class _SearchCodeProductDialogState
    extends ConsumerState<SearchCodeProductDialog> {
  final database = AppDatabase();
  TextEditingController textControllerSearchQuery = TextEditingController();
  List<Product> productList = [];
  int totalPageNumber = 0;
  int currentPageNumber = 0;
  int limitPerPage = 10;

  @override
  void initState() {
    super.initState();

    final initialProductList =
        ref.read(ordersStore.select((value) => value.initialProductList));
    final initialTotaProductPage =
        ref.read(ordersStore.select((value) => value.initialTotalProductPage));

    setState(() {
      productList = initialProductList;
      totalPageNumber = initialTotaProductPage;
    });
  }

  void searchDataProducts() {
    database.productsDao
        .searchDataProducts(limitPerPage, textControllerSearchQuery.text)
        .then((value) {
      setState(() {
        productList = value.products;
      });
    });

    database.productsDao
        .getTotalRowCount(limitPerPage, textControllerSearchQuery.text)
        .then((value) {
      setState(() {
        totalPageNumber = value;
      });
    });
  }

  void onPressNextPage() {
    if ((currentPageNumber + 1) < totalPageNumber) {
      database.productsDao
          .getItemsPerPage(currentPageNumber + 1, limitPerPage,
              textControllerSearchQuery.text)
          .then((value) {
        setState(() {
          currentPageNumber = currentPageNumber + 1;
          productList = value.products;
        });
      });
    }
  }

  void onPressPreviousPage() {
    if (currentPageNumber > 0) {
      database.productsDao
          .getItemsPerPage(currentPageNumber - 1, limitPerPage,
              textControllerSearchQuery.text)
          .then((value) {
        setState(() {
          currentPageNumber = currentPageNumber - 1;
          productList = value.products;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderAction = ref.read(ordersStore.notifier);

    return IntrinsicHeight(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextInput(
                  label: '',
                  hintTextField: 'Cari kode produk',
                  isError: false,
                  width: 260,
                  textController: textControllerSearchQuery,
                  onEditingComplete: searchDataProducts,
                ),
                Button(
                  onPress: searchDataProducts,
                  text: 'Cari',
                  backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                  textColor: Colors.white,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Kode Produk',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SeparatorVertical(
                    height: 20,
                  ),
                  Text(
                    'Nama Produk',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 530,
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                orderAction.onSelectProduct(
                                  widget.indexField,
                                  productList[index],
                                );
                                SmartDialog.dismiss();
                              },
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text(productList[index].code),
                                  ),
                                  const SeparatorVertical(
                                    height: 20,
                                  ),
                                  Text(productList[index].name),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const SeparatorHorizontal(),
                      Visibility(
                        visible: (index + 1) != productList.length,
                        child: const SizedBox(height: 10),
                      )
                    ],
                  );
                },
              ),
            ),
            Footer(
              currentPage: currentPageNumber,
              totalPage: totalPageNumber,
              onPressNextPage: onPressNextPage,
              onPressPreviousPage: onPressPreviousPage,
            ),
          ],
        ),
      ),
    );
  }
}
