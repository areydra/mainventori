// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType {
  number,
  text,
}

class DialogField extends StatefulWidget {
  final String label;
  final String hintTextField;
  final double height;
  final dynamic textError;
  late final TextEditingController textController;
  void Function(String)? onChangeValue;
  final FieldType? fieldType;

  DialogField({
    Key? key,
    required this.label,
    required this.hintTextField,
    required this.textError,
    this.height = 61,
    this.onChangeValue,
    this.fieldType = FieldType.text,
    TextEditingController? textController, // Make it nullable
  })  : textController = textController ?? TextEditingController(),
        super(key: key);

  @override
  State<DialogField> createState() => _DialogFieldState();
}

class _DialogFieldState extends State<DialogField> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.textError != null
        ? const Color.fromRGBO(189, 0, 0, 1)
        : const Color.fromRGBO(152, 159, 173, 1);

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text(widget.label),
            ),
          ),
        ),
        SizedBox(
          width: 274,
          height: widget.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: widget.textController,
                decoration: InputDecoration(
                  hintText: widget.hintTextField,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(133, 141, 157, 1),
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                ),
                onChanged: widget.onChangeValue,
                style: const TextStyle(fontSize: 16),
                keyboardType: TextInputType.emailAddress,
                inputFormatters: widget.fieldType == FieldType.number
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ]
                    : [],
              ),
              if (widget.textError != null)
                Container(
                  padding: const EdgeInsets.only(left: 4),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(189, 0, 0, 1),
                    ),
                    child: Text(
                      widget.textError,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
