import 'package:flutter/material.dart';

class ProductField extends StatefulWidget {
  final String label;
  final String hintTextField;

  const ProductField ({ Key? key, required this.label, required this.hintTextField }): super(key: key);

  @override
  State<ProductField> createState() => _ProductFieldState();
}

class _ProductFieldState extends State<ProductField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: 
        Text(widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(72, 80, 94, 1)
          ),
        ),          
      ),
      SizedBox(
        width: 274,
        height: 44,
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: widget.hintTextField,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromRGBO(152, 159, 173, 1), width: 1),
              borderRadius: BorderRadius.circular(8)
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(152, 159, 173, 1), width: 1),
            ),
            hintStyle: const TextStyle(fontSize: 16, color: Color.fromRGBO(133, 141, 157, 1)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
          ),
          style: const TextStyle(fontSize: 16),
        ),
      )
    ]);
  }
}