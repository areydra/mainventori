import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class CustomDialog extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String textConfirm;
  final String textCancel;
  final List<Widget> content;
  final Function onPressConfirm;
  final Function onPressCancel;

  const CustomDialog({
    Key? key,
    this.width = 500,
    this.height = 550,
    this.content = const [],
    required this.title,
    required this.textConfirm,
    required this.textCancel,
    required this.onPressConfirm,
    required this.onPressCancel,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(56, 62, 73, 1),
            ),
            child: Text(widget.title),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 32),
            child: Column(
              children: [...widget.content],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Wrap(spacing: 12, children: [
                ElevatedButton(
                  onPressed: () => widget.onPressCancel(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      width: 1,
                      color: Color.fromRGBO(133, 141, 157, 1),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: SizedBox(
                    width: 74,
                    height: 35,
                    child: Center(
                      child: Text(
                        widget.textCancel,
                        style: const TextStyle(
                          color: Color.fromRGBO(133, 141, 157, 1),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => widget.onPressConfirm(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                  ),
                  child: SizedBox(
                    width: 95,
                    height: 35,
                    child: Center(
                      child: Text(
                        widget.textConfirm,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ])
            ],
          )
        ]),
      ),
    );
  }
}
