import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';
import 'package:mainventori/widgets/custom_dialog/widgets/dialog_field.dart';

class DialogCustomerFields extends StatefulWidget {
  const DialogCustomerFields({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogCustomerFields> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 500,
      height: 550,
      title: 'New Customer',
      textConfirm: 'Add Customer',
      textCancel: 'Discard',
      onPressConfirm: () => {},
      onPressCancel: () => {},
      content: [
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [6],
              color: const Color.fromRGBO(157, 157, 157, 1),
              radius: const Radius.circular(80),
              child: const SizedBox(
                width: 80,
                height: 80,
                child: Image(
                  image: AssetImage('assets/icons/user.png'),
                  width: 70,
                  height: 70,
                ),
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
        DialogField(
          label: 'Customer Name',
          hintTextField: 'Enter customer name',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Contact Number',
          hintTextField: 'Enter customer contact number',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Email',
          hintTextField: 'Enter customer email',
          textError: '',
        ),
        const SizedBox(height: 24),
        DialogField(
          label: 'Address',
          hintTextField: 'Enter customer address',
          textError: '',
        ),
      ],
    );
  }
}
