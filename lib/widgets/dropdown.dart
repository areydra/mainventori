import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String label;
  final String hintTextField;
  final double height;
  final double width;
  final TextEditingController selectedValue;
  final List<String> dropdownItems;
  final bool isError;
  final Function(String) onChangeValue;

  const Dropdown({
    Key? key,
    required this.label,
    required this.hintTextField,
    this.height = 61,
    this.width = 150,
    required this.isError,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChangeValue,
  }) : super(key: key);

  factory Dropdown.withSelectedValue({
    Key? key,
    required String label,
    required String hintTextField,
    double height = 60,
    required TextEditingController selectedValue,
    required List<String> dropdownItems,
    required bool isError,
    required onChangeValue,
  }) {
    return Dropdown(
      key: key,
      label: label,
      hintTextField: hintTextField,
      height: height,
      selectedValue: selectedValue,
      dropdownItems: dropdownItems,
      isError: isError,
      onChangeValue: onChangeValue,
    );
  }

  @override
  State<Dropdown> createState() => _DialogDropdownState();
}

class _DialogDropdownState extends State<Dropdown> {
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
              DropdownButtonFormField(
                value: widget.selectedValue.text.isEmpty
                    ? null
                    : widget.selectedValue.text.toString(),
                hint: Text(widget.hintTextField,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(133, 141, 157, 1),
                      fontWeight: FontWeight.normal,
                    )),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                ),
                dropdownColor: Colors.white,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.selectedValue.text = newValue ?? "";
                  });
                  widget.onChangeValue(newValue!);
                },
                items: widget.dropdownItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
