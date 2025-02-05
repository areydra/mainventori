import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DialogDatePicker extends StatefulWidget {
  final String label;
  final String hintTextField;
  final double height;
  final dynamic textError;
  late final TextEditingController textController;
  void Function(String)? onChangeValue;

  DialogDatePicker({
    Key? key,
    required this.label,
    required this.hintTextField,
    required this.textError,
    this.height = 64,
    this.onChangeValue,
    TextEditingController? textController, // Make it nullable
  })  : textController = textController ?? TextEditingController(),
        super(key: key);

  @override
  State<DialogDatePicker> createState() => _DialogDatePickerState();
}

class _DialogDatePickerState extends State<DialogDatePicker> {
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.transparent), // Make button transparent
                  elevation:
                      MaterialStateProperty.all<double>(0), // Remove elevation
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: borderColor,
                          width: 1), // Border color and width
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 44),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 22,
                    ),
                  ),
                ),
                onPressed: () {
                  SmartDialog.show(builder: (_) {
                    return SizedBox(
                      width: 280,
                      height: 280,
                      child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        home: getDateRangePicker(
                            widget.textController, widget.onChangeValue),
                      ),
                    );
                  });
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.textController.text.isEmpty
                              ? widget.hintTextField
                              : widget.textController.text,
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.textController.text.isEmpty
                                ? const Color.fromRGBO(133, 141, 157, 1)
                                : Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.calendar_month,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
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

Widget getDateRangePicker(TextEditingController textController,
    void Function(String)? onChangeValue) {
  return Container(
    height: 250,
    child: Card(
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        showNavigationArrow: true,
        initialDisplayDate: textController.text.isNotEmpty
            ? DateFormat("dd MMMM yyyy").parse(textController.text)
            : null,
        initialSelectedDate: textController.text.isNotEmpty
            ? DateFormat("dd MMMM yyyy").parse(textController.text)
            : null,
        todayHighlightColor: textController.text.isEmpty
            ? const Color.fromRGBO(68, 141, 242, 1)
            : Colors.transparent,
        selectionColor: const Color.fromRGBO(68, 141, 242, 1),
        selectionMode: DateRangePickerSelectionMode.single,
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) => {
          textController.text = DateFormat('dd MMMM yyyy').format(args.value),
          onChangeValue!(DateFormat('dd MMMM yyyy').format(args.value)),
          SmartDialog.dismiss(),
        },
      ),
    ),
  );
}
