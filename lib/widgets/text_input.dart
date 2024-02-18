// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CustomTextInputType {
  number,
  text,
}

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  final String label;
  final String hintTextField;
  final double height;
  final double width;
  final bool isError;
  late final TextEditingController textController;
  void Function(String)? onChangeValue;
  final CustomTextInputType? fieldType;

  TextInput({
    Key? key,
    required this.label,
    required this.hintTextField,
    required this.isError,
    this.height = 60,
    this.width = 150,
    this.onChangeValue,
    this.fieldType = CustomTextInputType.text,
    TextEditingController? textController, // Make it nullable
  })  : textController = textController ?? TextEditingController(),
        super(key: key);

  @override
  State<TextInput> createState() => _FieldState();
}

class _FieldState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.isError
        ? const Color.fromRGBO(189, 0, 0, 1)
        : const Color.fromRGBO(152, 159, 173, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.label.isNotEmpty,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(72, 80, 94, 1),
            ),
            child: Text(widget.label),
          ),
        ),
        SizedBox(height: widget.label.isEmpty ? 12 : 10),
        SizedBox(
          width: widget.width,
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
                inputFormatters: widget.fieldType == CustomTextInputType.number
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ]
                    : [],
              ),
            ],
          ),
        )
      ],
    );
  }
}
