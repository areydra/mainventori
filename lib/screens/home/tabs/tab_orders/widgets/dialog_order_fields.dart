import 'package:flutter/material.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class DialogOrderFields extends StatefulWidget {
  const DialogOrderFields({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogOrderFields> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 500,
      height: 776,
      title: 'New Order',
      textConfirm: 'Add Order',
      textCancel: 'Discard',
      onPressConfirm: () => {},
      onPressCancel: () => {},
      content: [
        const SizedBox(height: 12),
        DialogField(
          label: 'Product Name',
          hintTextField: 'Enter product name',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Product ID',
          hintTextField: 'Enter product ID',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Category',
          hintTextField: 'Select product category',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Customer',
          hintTextField: 'Select customer',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Order value',
          hintTextField: 'Enter order value',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Quantity',
          hintTextField: 'Enter product quantity',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Unit',
          hintTextField: 'Enter product unit',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Buying price',
          hintTextField: 'Enter buying price',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Date of delivery',
          hintTextField: 'Enter date of delivery',
          textError: '',
        ),
      ],
    );
  }
}
