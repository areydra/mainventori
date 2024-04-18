// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/models/product_list_controller.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/add_new_product_dialog_header.dart';
import 'package:mainventori/widgets/button.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/date_picker.dart';
import 'package:mainventori/widgets/dropdown.dart';
import 'package:mainventori/widgets/text_input.dart';

class AddNewProductDialog extends StatefulWidget {
  final Function refreshDataProducts;

  const AddNewProductDialog({
    Key? key,
    required this.refreshDataProducts,
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

  List<ProductListController> listController = [
    ProductListController(
      code: TextEditingController(),
      name: TextEditingController(),
      category: TextEditingController(),
      supplier: TextEditingController(),
      buyingPrice: TextEditingController(),
      quantity: TextEditingController(),
      unit: TextEditingController(),
      dateIn: TextEditingController(),
      minStock: TextEditingController(),
    )
  ];

  List<List<String>> listControllerError = [
    [
      'code',
      'name',
      'category',
      'supplier',
      'buyingPrice',
      'quantity',
      'unit',
      'dateIn',
      'minStock',
    ]
  ];

  List<String> shouldCheckValidationByFieldIndex = [];
  bool isSaving = false;
  List<String> suppliers = [];

  @override
  void initState() {
    super.initState();

    database.suppliersDao.getItemsPerPage().then((value) {
      List<String> newSuppliers = [];

      for (var i = 0; i < value.length; i++) {
        newSuppliers.add(value[i].name);
      }

      setState(() {
        suppliers = newSuppliers;
      });
    });
  }

  bool validation() {
    bool isFieldValid = true;

    for (int index = 0; index < listControllerError.length; index++) {
      var value = listControllerError[index];
      if (value.isNotEmpty && isFieldValid) {
        isFieldValid = false;
      }

      if (value.isNotEmpty &&
          !shouldCheckValidationByFieldIndex.contains(index.toString())) {
        setState(() {
          shouldCheckValidationByFieldIndex.add(index.toString());
        });
      }
    }

    return isFieldValid;
  }

  void onChangeValue(int index, String key) {
    setState(() {
      switch (key) {
        case 'code':
          if (listController[index].code.text.isEmpty) {
            if (!listControllerError[index].contains('code')) {
              listControllerError[index].add('code');
            }
          } else {
            if (listControllerError[index].contains('code')) {
              listControllerError[index].remove('code');
            }
          }
          break;
        case 'name':
          if (listController[index].name.text.isEmpty) {
            if (!listControllerError[index].contains('name')) {
              listControllerError[index].add('name');
            }
          } else {
            if (listControllerError[index].contains('name')) {
              listControllerError[index].remove('name');
            }
          }
          break;
        case 'category':
          if (listController[index].category.text.isEmpty) {
            if (!listControllerError[index].contains('category')) {
              listControllerError[index].add('category');
            }
          } else {
            if (listControllerError[index].contains('category')) {
              listControllerError[index].remove('category');
            }
          }
          break;
        case 'supplier':
          if (listController[index].supplier.text.isEmpty) {
            if (!listControllerError[index].contains('supplier')) {
              listControllerError[index].add('supplier');
            }
          } else {
            if (listControllerError[index].contains('supplier')) {
              listControllerError[index].remove('supplier');
            }
          }
          break;
        case 'buyingPrice':
          if (listController[index].buyingPrice.text.isEmpty) {
            if (!listControllerError[index].contains('buyingPrice')) {
              listControllerError[index].add('buyingPrice');
            }
          } else {
            if (listControllerError[index].contains('buyingPrice')) {
              listControllerError[index].remove('buyingPrice');
            }
          }
          break;
        case 'quantity':
          if (listController[index].quantity.text.isEmpty) {
            if (!listControllerError[index].contains('quantity')) {
              listControllerError[index].add('quantity');
            }
          } else {
            if (listControllerError[index].contains('quantity')) {
              listControllerError[index].remove('quantity');
            }
          }
          break;
        case 'unit':
          if (listController[index].unit.text.isEmpty) {
            if (!listControllerError[index].contains('unit')) {
              listControllerError[index].add('unit');
            }
          } else {
            if (listControllerError[index].contains('unit')) {
              listControllerError[index].remove('unit');
            }
          }
          break;
        case 'dateIn':
          if (listController[index].dateIn.text.isEmpty) {
            if (!listControllerError[index].contains('dateIn')) {
              listControllerError[index].add('dateIn');
            }
          } else {
            if (listControllerError[index].contains('dateIn')) {
              listControllerError[index].remove('dateIn');
            }
          }
          break;
        case 'minStock':
          if (listController[index].minStock.text.isEmpty) {
            if (!listControllerError[index].contains('minStock')) {
              listControllerError[index].add('minStock');
            }
          } else {
            if (listControllerError[index].contains('minStock')) {
              listControllerError[index].remove('minStock');
            }
          }
          break;
      }
    });
  }

  void onPressConfirm() async {
    setState(() {
      isSaving = true;
    });
    if (!validation()) {
      setState(() {
        isSaving = false;
      });
      return;
    }

    int quantity = 0;
    List<ProductsCompanion> products = [];
    DateFormat dateFormat = DateFormat("dd MMMM yyyy");

    for (var value in listController) {
      products.add(
        ProductsCompanion(
          code: Value(value.code.text),
          name: Value(value.name.text),
          category: Value(value.category.text),
          supplier: Value(value.supplier.text),
          buyingPrice: Value(int.parse(value.buyingPrice.text)),
          quantity: Value(int.parse(value.quantity.text)),
          unit: Value(value.unit.text),
          dateIn: Value(dateFormat.parse(value.dateIn.text)),
          minStock: Value(int.parse(value.minStock.text)),
        ),
      );

      quantity += int.parse(value.quantity.text);
    }

    await database.batch((batch) {
      batch.insertAll(database.products, products);
      database.salesSummaryDao.addCurrentSalesSummaryQuantity(quantity);
    }).then((_) async {
      widget.refreshDataProducts.call();
      SmartDialog.dismiss();
    }).catchError((error) async {
      for (int index = 0; index < products.length; index++) {
        if (!listControllerError[index].contains('code')) {
          listControllerError[index].add('code');
          if (!shouldCheckValidationByFieldIndex.contains(index.toString())) {
            setState(() {
              shouldCheckValidationByFieldIndex.add(index.toString());
            });
          }
        }
      }
      SmartDialog.show(builder: (context) {
        return Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Kode produk yang baru ditambahkan atau yang sudah disimpan harus unik. Mohon pastikan tidak ada duplikasi dalam kode produk!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      });
    }).whenComplete(() {
      setState(() {
        isSaving = false;
      });
    });
  }

  void onPressAddItem() {
    setState(() {
      listController.add(ProductListController(
        code: TextEditingController(),
        name: TextEditingController(),
        category: TextEditingController(),
        supplier: TextEditingController(),
        buyingPrice: TextEditingController(),
        quantity: TextEditingController(),
        unit: TextEditingController(),
        dateIn: TextEditingController(),
        minStock: TextEditingController(),
      ));
      listControllerError.add([
        'code',
        'name',
        'category',
        'supplier',
        'buyingPrice',
        'quantity',
        'unit',
        'dateIn',
        'minStock',
      ]);
    });
  }

  void onPressDeleteItem(int index) {
    setState(() {
      listController.removeAt(index);
      listControllerError.removeAt(index);
      shouldCheckValidationByFieldIndex.remove(index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 1505,
      height: 980,
      title: 'New Product',
      textConfirm: isSaving ? 'Adding Product..' : 'Add Product',
      textCancel: 'Discard',
      onPressConfirm: onPressConfirm,
      onPressCancel: SmartDialog.dismiss,
      content: [
        const AddNewProductDialogHeader(),
        LayoutBuilder(builder: (context, constraints) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 680, // Set the maximum height here
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listController.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    TextInput(
                      label: '',
                      hintTextField: 'Kode Produk',
                      textController: listController[index].code,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('code')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "code"),
                      width: 130,
                    ),
                    const SizedBox(width: 8),
                    TextInput(
                      label: '',
                      hintTextField: 'Nama Produk',
                      textController: listController[index].name,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('name')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "name"),
                      width: 200,
                    ),
                    const SizedBox(width: 8),
                    Dropdown(
                      label: '',
                      hintTextField: 'Pilih Kategori',
                      dropdownItems: const ['Drink', 'Food'],
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('category')
                          : false,
                      selectedValue: listController[index].category,
                      onChangeValue: (_) => onChangeValue(index, "category"),
                    ),
                    const SizedBox(width: 8),
                    Dropdown(
                      label: '',
                      hintTextField: 'Pilih supplier',
                      dropdownItems: suppliers,
                      selectedValue: listController[index].supplier,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('supplier')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "supplier"),
                    ),
                    const SizedBox(width: 8),
                    TextInput(
                      label: '',
                      hintTextField: '0',
                      textController: listController[index].buyingPrice,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('buyingPrice')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "buyingPrice"),
                      fieldType: CustomTextInputType.number,
                      width: 200,
                    ),
                    const SizedBox(width: 8),
                    TextInput(
                      label: '',
                      hintTextField: '0',
                      textController: listController[index].quantity,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('quantity')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "quantity"),
                      fieldType: CustomTextInputType.number,
                      width: 100,
                    ),
                    const SizedBox(width: 8),
                    TextInput(
                      label: '',
                      hintTextField: '0',
                      textController: listController[index].minStock,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('minStock')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "minStock"),
                      fieldType: CustomTextInputType.number,
                      width: 100,
                    ),
                    const SizedBox(width: 8),
                    TextInput(
                      label: '',
                      hintTextField: 'Unit',
                      textController: listController[index].unit,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('unit')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "unit"),
                      width: 100,
                    ),
                    const SizedBox(width: 8),
                    DatePicker(
                      label: '',
                      hintTextField: 'Pilh tanggal',
                      textController: listController[index].dateIn,
                      isError: shouldCheckValidationByFieldIndex
                              .contains(index.toString())
                          ? listControllerError[index].contains('dateIn')
                          : false,
                      onChangeValue: (_) => onChangeValue(index, "dateIn"),
                      width: 200,
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: listController.length > 1
                          ? () {
                              onPressDeleteItem(index);
                            }
                          : null,
                      icon: Icon(
                        Icons.delete,
                        color: listController.length > 1
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
        const SizedBox(height: 10),
        Button(
          onPress: onPressAddItem,
          text: 'Add Item',
          backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
          textColor: Colors.white,
        )
      ],
    );
  }
}
