import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers/widgets/add_new_supplier_dialog.dart';

class Header extends StatefulWidget {
  final Function addNewSupplier;

  const Header({
    Key? key,
    required this.addNewSupplier,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Suppliers',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 320,
                height: 44,
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: const Color.fromRGBO(240, 241, 243, 1)),
                  ),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/icons/search.png'),
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 6,
                            ),
                            hintText: 'Search supplier',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              height: 2.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(19, 102, 217, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 26))),
                  onPressed: () {
                    SmartDialog.show(builder: (_) {
                      return DialogSupplierFields(
                        addNewSupplier: widget.addNewSupplier,
                      );
                    });
                  },
                  child: const Text(
                    'Add Suppliers',
                    style: TextStyle(fontSize: 14),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
