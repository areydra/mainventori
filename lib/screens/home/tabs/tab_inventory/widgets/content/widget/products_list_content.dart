import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/edit_product_dialog.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductsListContent extends ConsumerWidget {
  final List<Product> products;
  final Function refreshDataProducts;

  const ProductsListContent({
    Key? key,
    required this.products,
    required this.refreshDataProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userStore.notifier.select((value) => value.user));

    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
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
                      width: 135,
                      child: Text(
                        products[index].code,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        products[index].name,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        'Rp${NumberFormat.decimalPattern('id').format(products[index].buyingPrice)}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        '${products[index].quantity} ${products[index].unit}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: Text(
                        '${products[index].minStock} ${products[index].unit}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: Text(
                        DateFormat('dd MMMM yyyy')
                            .format(products[index].dateIn),
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 165,
                      child: products[index].quantity == 0
                          ? const Text(
                              'Out of stock',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(218, 62, 51, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : products[index].quantity <= products[index].minStock
                              ? const Text(
                                  'Low stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(225, 145, 51, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'In stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(16, 167, 96, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                    ),
                    Visibility(
                      visible: user!.isAdmin,
                      child: Button(
                        text: 'Edit',
                        textColor: Colors.white,
                        backgroundColor: const Color.fromRGBO(225, 131, 8, 1),
                        onPress: () {
                          SmartDialog.show(builder: (_) {
                            return EditProductDialog(
                              product: products[index],
                              refreshDataProducts: refreshDataProducts,
                            );
                          });
                        },
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
    );
  }
}
