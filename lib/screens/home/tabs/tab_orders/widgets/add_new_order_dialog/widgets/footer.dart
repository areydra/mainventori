import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/date_picker.dart';
import 'package:mainventori/widgets/dropdown.dart';
import 'package:mainventori/widgets/separator_vertical.dart';

class AddNewOrderDialogFooter extends ConsumerStatefulWidget {
  const AddNewOrderDialogFooter({super.key});

  @override
  ConsumerState<AddNewOrderDialogFooter> createState() =>
      _AddNewOrderDialogFooterState();
}

class _AddNewOrderDialogFooterState
    extends ConsumerState<AddNewOrderDialogFooter> {
  @override
  Widget build(BuildContext context) {
    final isSaving = ref.watch(ordersStore.select((value) => value.isSaving));
    final isEmptyDeliveryDate =
        ref.watch(ordersStore.select((value) => value.isEmptyDeliveryDate));
    final isEmptyCustomer =
        ref.watch(ordersStore.select((value) => value.isEmptyCustomer));
    final orderAction = ref.read(ordersStore.notifier);

    ref.watch(
        ordersStore.select((value) => value.textControllerDeliveryDate.text));
    ref.watch(ordersStore.select((value) => value.textControllerCustomer.text));

    return Column(
      children: [
        const SizedBox(height: 10),
        IntrinsicWidth(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(240, 241, 243, 1),
                ),
                left: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(240, 241, 243, 1),
                ),
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
            ),
            padding: const EdgeInsets.only(top: 14, left: 29),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DatePicker(
                  label: 'Tanggal Pengiriman',
                  hintTextField: 'Pilih tanggal',
                  textController: orderAction.textControllerDeliveryDate,
                  isError: isEmptyDeliveryDate,
                  onChangeValue: orderAction.onChangeDeliveryDate,
                  width: 200,
                ),
                const SizedBox(width: 12),
                Dropdown(
                  label: 'Customer',
                  hintTextField: 'Pilih Costumer',
                  dropdownItems: const ['MaCustomer', 'MaBlock'],
                  isError: isEmptyCustomer,
                  selectedValue: orderAction.textControllerCustomer,
                  onChangeValue: orderAction.onChangeCustomer,
                  width: 158,
                ),
                const SizedBox(width: 24),
                const SeparatorVertical(),
                const SizedBox(width: 24),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Button(
                    onPress: () => {},
                    text: 'Discard',
                    backgroundColor: Colors.white,
                    borderColor: const Color.fromRGBO(133, 141, 157, 1),
                    textColor: const Color.fromRGBO(133, 141, 157, 1),
                  ),
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Button(
                    onPress: orderAction.saveToDatabase,
                    text: isSaving ? 'Adding Order...' : 'Add Order',
                    backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
