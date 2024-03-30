import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/search_code_product_dialog.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/button_text_input.dart';
import 'package:mainventori/widgets/text_input.dart';

class AddNewOrderDialogContent extends ConsumerStatefulWidget {
  const AddNewOrderDialogContent({super.key});

  @override
  ConsumerState<AddNewOrderDialogContent> createState() =>
      _AddNewOrderDialogContentState();
}

class _AddNewOrderDialogContentState
    extends ConsumerState<AddNewOrderDialogContent> {
  @override
  Widget build(BuildContext context) {
    final orderState = ref.watch(ordersStore);
    final orderAction = ref.read(ordersStore.notifier);

    Map<String, int> getTotalPrice() {
      int buyingPrice = 0;
      int sellingPrice = 0;

      for (var e in orderState.orders) {
        int quantity = int.tryParse(e.quantity.text) ?? 0;

        if (e.price.text.isNotEmpty) {
          buyingPrice += (int.tryParse(e.price.text)! * quantity);
        }

        if (e.sellingPrice.text.isNotEmpty) {
          sellingPrice += (int.tryParse(e.sellingPrice.text)! * quantity);
        }
      }

      orderState.onChangeTotalOrdersSellingPrice(sellingPrice.toString());
      return {
        'buyingPrice': buyingPrice,
        'sellingPrice': sellingPrice,
      };
    }

    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 680, // Set the maximum height here
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orderState.orders.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ButtonTextInput(
                        text: orderState.orders[index].code.text.isNotEmpty
                            ? orderState.orders[index].code.text
                            : 'Kode Produk',
                        textColor: orderState.orders[index].code.text.isNotEmpty
                            ? Colors.black
                            : const Color.fromRGBO(152, 159, 173, 1),
                        isError: orderState.orders[index].isError &&
                            orderState.ordersListError[index].contains('code'),
                        onPress: () {
                          SmartDialog.show(builder: (context) {
                            return SearchCodeProductDialog(indexField: index);
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      TextInput(
                        label: '',
                        hintTextField: 'Nama Produk',
                        textController: orderState.orders[index].name,
                        isError: orderState.orders[index].isError
                            ? orderState.ordersListError[index].contains('name')
                            : false,
                        onChangeValue: (_) =>
                            orderAction.onChangeValue(index, "name"),
                        width: 200,
                        isEnabled: false,
                        textColor: orderState.orders[index].name.text.isNotEmpty
                            ? Colors.black
                            : null,
                      ),
                      const SizedBox(width: 8),
                      TextInput(
                        label: '',
                        hintTextField: '0',
                        textController: orderState.orders[index].price,
                        isError: orderState.orders[index].isError
                            ? orderState.ordersListError[index]
                                .contains('price')
                            : false,
                        onChangeValue: (_) =>
                            orderAction.onChangeValue(index, "price"),
                        fieldType: CustomTextInputType.number,
                        width: 200,
                        isEnabled: false,
                        textColor:
                            orderState.orders[index].price.text.isNotEmpty
                                ? Colors.black
                                : null,
                      ),
                      const SizedBox(width: 8),
                      TextInput(
                        label: '',
                        hintTextField: '0',
                        textController: orderState.orders[index].sellingPrice,
                        isError: orderState.orders[index].isError
                            ? orderState.ordersListError[index]
                                .contains('sellingPrice')
                            : false,
                        onChangeValue: (_) =>
                            orderAction.onChangeValue(index, "sellingPrice"),
                        fieldType: CustomTextInputType.number,
                        width: 200,
                      ),
                      const SizedBox(width: 8),
                      TextInput(
                        label: '',
                        hintTextField: '0',
                        textController: orderState.orders[index].quantity,
                        isError: orderState.orders[index].isError
                            ? orderState.ordersListError[index]
                                .contains('quantity')
                            : false,
                        onChangeValue: (_) =>
                            orderAction.onChangeValue(index, "quantity"),
                        fieldType: CustomTextInputType.number,
                        width: 100,
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: orderState.orders.length > 1
                            ? () {
                                orderAction.deleteOrder(index);
                              }
                            : null,
                        icon: Icon(
                          Icons.delete,
                          color: orderState.orders.length > 1
                              ? const Color.fromRGBO(218, 62, 51, 1)
                              : const Color.fromRGBO(102, 112, 133, 1),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  onPress: orderAction.addOrder,
                  text: 'Add Item',
                  backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                  textColor: Colors.white,
                ),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(72, 80, 94, 1),
                            ),
                            child: Text('Total Harga'),
                          ),
                          const SizedBox(width: 60),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(72, 80, 94, 1),
                            ),
                            child: Text(
                                'Rp${NumberFormat.decimalPattern('id').format(getTotalPrice()['buyingPrice'])}'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(72, 80, 94, 1),
                            ),
                            child: Text('Total Harga Jual'),
                          ),
                          const SizedBox(width: 60),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(72, 80, 94, 1),
                            ),
                            child: Text(
                                'Rp${NumberFormat.decimalPattern('id').format(getTotalPrice()['sellingPrice'])}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
