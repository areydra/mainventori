// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_date_picker.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_dropdown.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class AddNewProductDialog extends StatefulWidget {
  final Function addNewProduct;

  const AddNewProductDialog({
    Key? key,
    required this.addNewProduct,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddNewProductDialogState createState() => _AddNewProductDialogState();
}

class _AddNewProductDialogState extends State<AddNewProductDialog> {
  final database = AppDatabase();

  Map<String, dynamic> textError = {
    "category": null,
    "productName": null,
    "supplier": null,
    "buyingPrice": null,
    "quantity": null,
    "unit": null,
    "expiryDate": null,
    "thresholdValue": null,
  };

  TextEditingController textCategory = TextEditingController();
  TextEditingController textProductName = TextEditingController();
  TextEditingController textSupplier = TextEditingController();
  TextEditingController textBuyingPrice = TextEditingController();
  TextEditingController textQuantity = TextEditingController();
  TextEditingController textUnit = TextEditingController();
  TextEditingController textExpiryDate = TextEditingController();
  TextEditingController textThresholdValue = TextEditingController();

  bool validation() {
    bool isFieldValid = true;

    setState(() {
      if (textCategory.text.isEmpty ||
          textProductName.text.isEmpty ||
          textSupplier.text.isEmpty ||
          textBuyingPrice.text.isEmpty ||
          textQuantity.text.isEmpty ||
          textUnit.text.isEmpty ||
          textExpiryDate.text.isEmpty ||
          textThresholdValue.text.isEmpty) {
        isFieldValid = false;
      } else {
        isFieldValid = true;
      }

      textError["category"] =
          textCategory.text.isEmpty ? "Category cannot be null!" : null;
      textError["productName"] =
          textProductName.text.isEmpty ? "Product name cannot be null!" : null;
      textError["supplier"] =
          textSupplier.text.isEmpty ? "Supplier cannot be null!" : null;
      textError["buyingPrice"] =
          textBuyingPrice.text.isEmpty ? "Buying price cannot be null!" : null;
      textError["quantity"] =
          textQuantity.text.isEmpty ? "Quantity cannot be null!" : null;
      textError["unit"] = textUnit.text.isEmpty ? "Unit cannot be null!" : null;
      textError["expiryDate"] =
          textExpiryDate.text.isEmpty ? "Expiry date cannot be null!" : null;
      textError["thresholdValue"] =
          textThresholdValue.text.isEmpty ? "Threshold cannot be null!" : null;
    });

    return isFieldValid;
  }

  saveProduct() async {
    if (!validation()) {
      return;
    }
    // save product into database
    final id =
        await database.into(database.products).insert(ProductsCompanion.insert(
              name: textProductName.text,
              expiryDate: textExpiryDate.text,
              unit: textUnit.text,
              buyingPrice: int.tryParse(textBuyingPrice.text) ?? 0,
              quantity: int.tryParse(textQuantity.text) ?? 0,
              thresholdValue: int.tryParse(textThresholdValue.text) ?? 0,
              category: textCategory.text,
              supplier: textSupplier.text,
            ));

    // save product into state
    widget.addNewProduct(Product(
      id: id,
      name: textProductName.text,
      expiryDate: textExpiryDate.text,
      unit: textUnit.text,
      buyingPrice: int.tryParse(textBuyingPrice.text) ?? 0,
      quantity: int.tryParse(textQuantity.text) ?? 0,
      thresholdValue: int.tryParse(textThresholdValue.text) ?? 0,
      category: textCategory.text,
      supplier: textSupplier.text,
    ));

    SmartDialog.dismiss();
  }

  void onChangeValue(dynamic key) {
    setState(() {
      textError[key] = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 500,
      height: 945,
      title: 'New Product',
      textConfirm: 'Add Product',
      textCancel: 'Discard',
      onPressConfirm: saveProduct,
      onPressCancel: SmartDialog.dismiss,
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
              DefaultTextStyle(
                style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1)),
                child: Text('Drag image here'),
              ),
              DefaultTextStyle(
                style: TextStyle(color: Color.fromRGBO(133, 141, 157, 1)),
                child: Text('or'),
              ),
              DefaultTextStyle(
                style: TextStyle(color: Color.fromRGBO(68, 141, 242, 1)),
                child: Text('Browse image'),
              ),
            ])
          ],
        ),
        const SizedBox(height: 32),
        DialogField(
          label: 'Product Name',
          hintTextField: 'Enter product name',
          textController: textProductName,
          textError: textError["productName"],
          onChangeValue: (_) => onChangeValue("productName"),
        ),
        const SizedBox(height: 24),
        DialogDropdown(
          label: 'Category',
          hintTextField: 'Select product category',
          dropdownItems: const ['Drink', 'Food'],
          textError: textError["category"],
          selectedValue: textCategory,
          onChangeValue: (_) => onChangeValue("category"),
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Supplier',
          hintTextField: 'Select supplier',
          textController: textSupplier,
          textError: textError["supplier"],
          onChangeValue: (_) => onChangeValue("supplier"),
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Buying Price',
          hintTextField: 'Enter buying price',
          textController: textBuyingPrice,
          textError: textError["buyingPrice"],
          onChangeValue: (_) => onChangeValue("buyingPrice"),
          fieldType: FieldType.number,
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Quantity',
          hintTextField: 'Enter product quantity',
          textController: textQuantity,
          textError: textError["quantity"],
          onChangeValue: (_) => onChangeValue("quantity"),
          fieldType: FieldType.number,
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Unit',
          hintTextField: 'Enter product unit',
          textController: textUnit,
          textError: textError["unit"],
          onChangeValue: (_) => onChangeValue("unit"),
        ),
        const SizedBox(height: 24),
        DialogDatePicker(
          label: 'Expiry Date',
          hintTextField: 'Select product date',
          textController: textExpiryDate,
          textError: textError["expiryDate"],
          onChangeValue: (_) => onChangeValue("expiryDate"),
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Threshold Value',
          hintTextField: 'Enter threshold value',
          textController: textThresholdValue,
          textError: textError["thresholdValue"],
          onChangeValue: (_) => onChangeValue("thresholdValue"),
          fieldType: FieldType.number,
        ),
      ],
    );
  }
}
