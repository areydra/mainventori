import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';
import 'package:mainventori/widgets/date_picker.dart';
import 'package:mainventori/widgets/dropdown.dart';

class EditProductDialog extends StatefulWidget {
  final Product product;
  final Function refreshDataProducts;

  const EditProductDialog({
    Key? key,
    required this.product,
    required this.refreshDataProducts,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProductDialog createState() => _EditProductDialog();
}

class _EditProductDialog extends State<EditProductDialog> {
  late TextEditingController productCodeController;
  late TextEditingController productNameController;
  late TextEditingController productCategoryController;
  late TextEditingController productSupplierController;
  late TextEditingController productBuyingPriceController;
  late TextEditingController productQuantityController;
  late TextEditingController productMinStockController;
  late TextEditingController productUnitController;
  late TextEditingController productDateInController;
  List<String> listControllerError = [];

  @override
  void initState() {
    super.initState();
    productCodeController = TextEditingController(text: widget.product.code);
    productNameController = TextEditingController(text: widget.product.name);
    productCategoryController =
        TextEditingController(text: widget.product.category);
    productSupplierController =
        TextEditingController(text: widget.product.supplier);
    productBuyingPriceController =
        TextEditingController(text: widget.product.buyingPrice.toString());
    productQuantityController =
        TextEditingController(text: widget.product.quantity.toString());
    productMinStockController =
        TextEditingController(text: widget.product.minStock.toString());
    productUnitController = TextEditingController(text: widget.product.unit);
    productDateInController = TextEditingController(
        text: DateFormat("dd MMMM yyyy").format(widget.product.dateIn));
  }

  bool errorCheck() {
    List<String> listError = [];

    if (productCodeController.text.isEmpty) {
      if (!listError.contains('code')) {
        listError.add('code');
      }
    } else {
      if (listError.contains('code')) {
        listError.remove('code');
      }
    }

    if (productNameController.text.isEmpty) {
      if (!listError.contains('name')) {
        listError.add('name');
      }
    } else {
      if (listError.contains('name')) {
        listError.remove('name');
      }
    }

    if (productCategoryController.text.isEmpty) {
      if (!listError.contains('category')) {
        listError.add('category');
      }
    } else {
      if (listError.contains('category')) {
        listError.remove('category');
      }
    }

    if (productSupplierController.text.isEmpty) {
      if (!listError.contains('supplier')) {
        listError.add('supplier');
      }
    } else {
      if (listError.contains('supplier')) {
        listError.remove('supplier');
      }
    }

    if (productBuyingPriceController.text.isEmpty) {
      if (!listError.contains('buyingPrice')) {
        listError.add('buyingPrice');
      }
    } else {
      if (listError.contains('buyingPrice')) {
        listError.remove('buyingPrice');
      }
    }

    if (productQuantityController.text.isEmpty) {
      if (!listError.contains('quantity')) {
        listError.add('quantity');
      }
    } else {
      if (listError.contains('quantity')) {
        listError.remove('quantity');
      }
    }

    if (productMinStockController.text.isEmpty) {
      if (!listError.contains('minStock')) {
        listError.add('minStock');
      }
    } else {
      if (listError.contains('minStock')) {
        listError.remove('minStock');
      }
    }

    if (productUnitController.text.isEmpty) {
      if (!listError.contains('unit')) {
        listError.add('unit');
      }
    } else {
      if (listError.contains('unit')) {
        listError.remove('unit');
      }
    }

    if (productDateInController.text.isEmpty) {
      if (!listError.contains('dateIn')) {
        listError.add('dateIn');
      }
    } else {
      if (listError.contains('dateIn')) {
        listError.remove('dateIn');
      }
    }

    setState(() {
      listControllerError = listError;
    });
    return listError.isNotEmpty;
  }

  void onPressConfirm() {
    if (errorCheck()) {
      return;
    }

    final database = AppDatabase();
    DateFormat dateFormat = DateFormat("dd MMMM yyyy");
    (database.update(database.products)
          ..where((column) => column.code.equals(widget.product.code)))
        .write(
          ProductsCompanion(
            code: Value(productCodeController.text),
            name: Value(productNameController.text),
            category: Value(productCategoryController.text),
            supplier: Value(productSupplierController.text),
            buyingPrice: Value(int.parse(productBuyingPriceController.text)),
            quantity: Value(int.parse(productQuantityController.text)),
            unit: Value(productUnitController.text),
            dateIn: Value(dateFormat.parse(productDateInController.text)),
            minStock: Value(int.parse(productMinStockController.text)),
          ),
        )
        .then((value) => {
              SmartDialog.dismiss(),
              widget.refreshDataProducts.call(),
            });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 500,
      height: 845,
      title: 'Edit Produk',
      textConfirm: 'Edit Produk',
      textCancel: 'Discard',
      onPressConfirm: onPressConfirm,
      onPressCancel: SmartDialog.dismiss,
      content: [
        const SizedBox(height: 12),
        DialogField(
          label: 'Kode Produk',
          hintTextField: 'Kode Produk ',
          textError: listControllerError.contains('code') ? '' : null,
          textController: productCodeController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 14),
        DialogField(
          label: 'Nama Produk',
          hintTextField: 'Nama Produk',
          textError: listControllerError.contains('name') ? '' : null,
          textController: productNameController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(72, 80, 94, 1),
                  ),
                  child: Text('Kategori'),
                ),
              ),
            ),
            Dropdown(
              label: '',
              hintTextField: 'Pilih Kategori',
              dropdownItems: const ['Drink', 'Food'],
              isError: listControllerError.contains('category'),
              selectedValue: productCategoryController,
              onChangeValue: (_) => errorCheck(),
              width: 274,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(72, 80, 94, 1),
                  ),
                  child: Text('Supplier'),
                ),
              ),
            ),
            Dropdown(
              label: '',
              hintTextField: 'Pilih Supplier',
              dropdownItems: const ['MaFood', 'MaDrink'],
              isError: listControllerError.contains('supplier'),
              selectedValue: productSupplierController,
              onChangeValue: (_) => errorCheck(),
              width: 274,
            ),
          ],
        ),
        const SizedBox(height: 14),
        DialogField(
          label: 'Harga Beli',
          hintTextField: '0',
          textError: listControllerError.contains('buyingPrice') ? '' : null,
          fieldType: FieldType.number,
          textController: productBuyingPriceController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 14),
        DialogField(
          label: 'Jumlah Stok',
          hintTextField: '0',
          textError: listControllerError.contains('quantity') ? '' : null,
          fieldType: FieldType.number,
          textController: productQuantityController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 14),
        DialogField(
          label: 'Min Stok',
          hintTextField: '0',
          textError: listControllerError.contains('minStock') ? '' : null,
          fieldType: FieldType.number,
          textController: productMinStockController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 14),
        DialogField(
          label: 'Unit',
          hintTextField: 'unit',
          textError: listControllerError.contains('unit') ? '' : null,
          textController: productUnitController,
          onChangeValue: (_) => errorCheck(),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(72, 80, 94, 1),
                  ),
                  child: Text('Tanggal Masuk'),
                ),
              ),
            ),
            DatePicker(
              label: '',
              hintTextField: 'Pilih Tanggal',
              textController: productDateInController,
              isError: listControllerError.contains('dateIn'),
              onChangeValue: (date) => {
                errorCheck(),
                setState(() {
                  productDateInController.text = date;
                }),
              },
              width: 274,
            ),
          ],
        )
      ],
    );
  }
}
