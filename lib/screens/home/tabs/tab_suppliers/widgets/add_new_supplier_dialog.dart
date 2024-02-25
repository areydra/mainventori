import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class DialogSupplierFields extends StatefulWidget {
  final Function refreshDataSuppliers;

  const DialogSupplierFields({
    Key? key,
    required this.refreshDataSuppliers,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogSupplierFields> {
  final database = AppDatabase();
  TextEditingController textName = TextEditingController();
  TextEditingController textContactNumber = TextEditingController();
  TextEditingController textEmail = TextEditingController();

  Map<String, dynamic> textError = {
    "name": null,
    "contactNumber": null,
    "email": null,
  };

  bool validation() {
    bool isValid = true;

    setState(() {
      if (textName.text.isEmpty ||
          textContactNumber.text.isEmpty ||
          textEmail.text.isEmpty) {
        isValid = false;
      } else {
        isValid = true;
      }

      textError['name'] =
          textName.text.isEmpty ? "Supplier name cannot be null!" : null;
      textError['contactNumber'] = textContactNumber.text.isEmpty
          ? "Contact number cannot be null!"
          : null;
      textError['email'] =
          textEmail.text.isEmpty ? "Email cannot be null!" : null;
    });

    return isValid;
  }

  onClickConfirm() async {
    if (!validation()) {
      return;
    }

    await database.into(database.suppliers).insert(SuppliersCompanion.insert(
          name: textName.text,
          contactNumber: textContactNumber.text,
          email: textEmail.text,
        ));

    widget.refreshDataSuppliers.call();
    SmartDialog.dismiss();
  }

  onClickCancel() {
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
      height: 400,
      title: 'New Supplier',
      textConfirm: 'Add Supplier',
      textCancel: 'Discard',
      onPressConfirm: onClickConfirm,
      onPressCancel: onClickCancel,
      content: [
        const SizedBox(height: 24),
        DialogField(
          label: 'Supplier Name',
          hintTextField: 'Enter supplier name',
          textError: textError["name"],
          textController: textName,
          onChangeValue: (_) => onChangeValue("name"),
        ),
        const SizedBox(height: 12),
        DialogField(
          label: 'Contact Number',
          hintTextField: 'Enter supplier contact number',
          textError: textError["contactNumber"],
          textController: textContactNumber,
          onChangeValue: (_) => onChangeValue("contactNumber"),
          fieldType: FieldType.number,
        ),
        const SizedBox(height: 12),
        DialogField(
          label: 'Email',
          hintTextField: 'Select supplier email',
          textError: textError["email"],
          textController: textEmail,
          onChangeValue: (_) => onChangeValue("email"),
        ),
      ],
    );
  }
}
