import 'package:flutter/material.dart';

class DialogDropdown extends StatefulWidget {
  final String label;
  final String hintTextField;
  final double height;
  final TextEditingController selectedValue;
  final List<String> dropdownItems;
  final dynamic textError;
  final Function(String?) onChangeValue;

  const DialogDropdown({
    Key? key,
    required this.label,
    required this.hintTextField,
    this.height = 61,
    required this.textError,
    required this.dropdownItems,
    required this.selectedValue,
    required this.onChangeValue,
  }) : super(key: key);

  factory DialogDropdown.withSelectedValue({
    Key? key,
    required String label,
    required String hintTextField,
    double height = 61,
    required TextEditingController selectedValue,
    required List<String> dropdownItems,
    required dynamic textError,
    required onChangeValue,
  }) {
    return DialogDropdown(
      key: key,
      label: label,
      hintTextField: hintTextField,
      height: height,
      selectedValue: selectedValue,
      dropdownItems: dropdownItems,
      textError: textError,
      onChangeValue: onChangeValue,
    );
  }

  @override
  State<DialogDropdown> createState() => _DialogDropdownState();
}

class _DialogDropdownState extends State<DialogDropdown> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.textError != null
        ? const Color.fromRGBO(189, 0, 0, 1)
        : const Color.fromRGBO(152, 159, 173, 1);

    return Row(
      children: [
        Expanded(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(72, 80, 94, 1),
            ),
            child: Text(widget.label),
          ),
        ),
        SizedBox(
          width: 274,
          height: widget.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField(
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
                  widget.onChangeValue(newValue);
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
        ),
      ],
    );
  }
}
