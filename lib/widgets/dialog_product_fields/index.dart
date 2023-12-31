import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/widgets/dialog_product_fields/widgets/product_field.dart';

class DialogProductFields extends StatefulWidget {
  const DialogProductFields({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogProductFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 874,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text(
          'New Product',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(56, 62, 73, 1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 32),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [6],
                    color: const Color.fromRGBO(157, 157, 157, 1),
                    radius: const Radius.circular(10),
                    child: 
                    const SizedBox(
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Column(children: [
                    Text('Drag image here', style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1))),
                    Text('or', style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1))),
                    Text('Browse image', style: TextStyle(color: Color.fromRGBO(68, 141, 242, 1))),
                  ])
                ],
              ),
              const SizedBox(height: 32),
              const ProductField(label: 'Product Name', hintTextField: 'Enter product name'),
              const SizedBox(height: 24),
              const ProductField(label: 'Product ID', hintTextField: 'Enter product ID'),
              const SizedBox(height: 24),
              const ProductField(label: 'Category', hintTextField: 'Select product category'),
              const SizedBox(height: 24),
              const ProductField(label: 'Supplier', hintTextField: 'Select supplier'),
              const SizedBox(height: 24),
              const ProductField(label: 'Buying Price', hintTextField: 'Enter buying price'),
              const SizedBox(height: 24),
              const ProductField(label: 'Quantity', hintTextField: 'Enter product quantity'),
              const SizedBox(height: 24),
              const ProductField(label: 'Unit', hintTextField: 'Enter product unit'),
              const SizedBox(height: 24),
              const ProductField(label: 'Expiry Date', hintTextField: 'Enter product date'),
              const SizedBox(height: 24),
              const ProductField(label: 'Threshold Value', hintTextField: 'Enter threshold value'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Wrap(spacing: 12, children: [
              ElevatedButton(
                onPressed: () => SmartDialog.dismiss(),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromRGBO(133, 141, 157, 1),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: const SizedBox(
                  width: 74,
                  height: 35,
                  child: Center(
                    child: Text(
                      'Discard',
                      style: TextStyle(
                        color: Color.fromRGBO(133, 141, 157, 1),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => SmartDialog.dismiss(),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                ),
                child: const SizedBox(
                  width: 80,
                  height: 35,
                  child: Center(
                    child: Text(
                      'Add Product',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        )
      ]),
    );
  }
}
