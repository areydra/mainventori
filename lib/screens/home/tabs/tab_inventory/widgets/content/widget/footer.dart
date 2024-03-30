import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  final int currentPage;
  final int totalPage;
  final void Function() onPressNextPage;
  final void Function() onPressPreviousPage;

  const Footer({
    Key? key,
    required this.currentPage,
    required this.totalPage,
    required this.onPressNextPage,
    required this.onPressPreviousPage,
  }) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 85,
            child: TextButton(
                onPressed: widget.onPressPreviousPage,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(
                                color: Color.fromRGBO(208, 211, 217, 1)))),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(72, 80, 94, 1)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10))),
                child: const Text(
                  'Previous',
                  style: TextStyle(fontSize: 14),
                )),
          ),
          Text("Page ${widget.currentPage + 1} of ${widget.totalPage}"),
          SizedBox(
            width: 85,
            child: TextButton(
                onPressed: widget.onPressNextPage,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(
                                color: Color.fromRGBO(208, 211, 217, 1)))),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(72, 80, 94, 1)),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 26))),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 14),
                )),
          ),
        ],
      ),
    );
  }
}
