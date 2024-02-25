import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class AddNewCustomerDialog extends StatefulWidget {
  final Function refreshDataCustomer;

  const AddNewCustomerDialog({
    Key? key,
    required this.refreshDataCustomer,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddNewCustomerDialog createState() => _AddNewCustomerDialog();
}

class _AddNewCustomerDialog extends State<AddNewCustomerDialog> {
  final database = AppDatabase();
  TextEditingController textName = TextEditingController();
  TextEditingController textContactNumber = TextEditingController();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textAddress = TextEditingController();

  Map<String, dynamic> textError = {
    "name": null,
    "contactNumber": null,
    "email": null,
    "address": null,
  };

  bool validation() {
    bool isValid = true;

    setState(() {
      if (textName.text.isEmpty) {
        isValid = false;
      } else {
        isValid = true;
      }

      textError['name'] =
          textName.text.isEmpty ? "Customer name cannot be null!" : null;
    });

    return isValid;
  }

  onClickConfirm() async {
    if (!validation()) {
      return;
    }

    await database.into(database.customers).insert(CustomersCompanion.insert(
          name: textName.text,
          contactNumber: textContactNumber.text,
          email: textEmail.text,
          address: textAddress.text,
        ));

    widget.refreshDataCustomer.call();
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
      height: 460,
      title: 'Pelanggan Baru',
      textConfirm: 'Tambahkan',
      textCancel: 'Batal',
      onPressConfirm: onClickConfirm,
      onPressCancel: onClickCancel,
      content: [
        const SizedBox(height: 24),
        DialogField(
          label: 'Nama',
          hintTextField: 'Nama',
          textError: textError["name"],
          textController: textName,
          onChangeValue: (_) => onChangeValue("name"),
        ),
        const SizedBox(height: 12),
        DialogField(
          label: 'Nomor Handphone',
          hintTextField: 'Nomor Handphone (opsional)',
          textError: textError["contactNumber"],
          textController: textContactNumber,
          onChangeValue: (_) => onChangeValue("contactNumber"),
          fieldType: FieldType.number,
        ),
        const SizedBox(height: 12),
        DialogField(
          label: 'Email',
          hintTextField: 'Email (opsional)',
          textError: textError["email"],
          textController: textEmail,
          onChangeValue: (_) => onChangeValue("email"),
        ),
        DialogField(
          label: 'Alamat',
          hintTextField: 'Alamat (opsional)',
          textError: textError["address"],
          textController: textAddress,
          onChangeValue: (_) => onChangeValue("address"),
        ),
      ],
    );
  }
}
