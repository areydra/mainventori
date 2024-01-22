import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class DialogProductFields extends StatefulWidget {
  const DialogProductFields({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogProductFields> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 500,
      height: 874,
      title: 'New Product',
      textConfirm: 'Add Product',
      textCancel: 'Discard',
      content: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [6],
              color: const Color.fromRGBO(157, 157, 157, 1),
              radius: const Radius.circular(10),
              child: const SizedBox(
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(width: 20),
            const Column(children: [
              Text('Drag image here',
                  style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1))),
              Text('or',
                  style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1))),
              Text('Browse image',
                  style: TextStyle(color: Color.fromRGBO(68, 141, 242, 1))),
            ])
          ],
        ),
        const SizedBox(height: 32),
        const DialogField(
            label: 'Product Name', hintTextField: 'Enter product name'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Product ID', hintTextField: 'Enter product ID'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Category', hintTextField: 'Select product category'),
        const SizedBox(height: 24),
        const DialogField(label: 'Supplier', hintTextField: 'Select supplier'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Buying Price', hintTextField: 'Enter buying price'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Quantity', hintTextField: 'Enter product quantity'),
        const SizedBox(height: 24),
        const DialogField(label: 'Unit', hintTextField: 'Enter product unit'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Expiry Date', hintTextField: 'Enter product date'),
        const SizedBox(height: 24),
        const DialogField(
            label: 'Threshold Value', hintTextField: 'Enter threshold value'),
      ],
    );
  }
}
