import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/screens/home/tabs/tab_customers/widgets/add_new_customer_dialog.dart';
import 'package:mainventori/widgets/button.dart';

class Header extends StatefulWidget {
  final Function refreshDataCustomers;
  final Function searchCustomers;

  const Header({
    Key? key,
    required this.refreshDataCustomers,
    required this.searchCustomers,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextEditingController textSearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Customers',
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
                            hintText: 'Search customer',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              height: 2.8,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          controller: textSearchController,
                          onEditingComplete: () => {
                            widget.searchCustomers
                                .call(textSearchController.text)
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Button(
                onPress: () => {
                  SmartDialog.show(builder: (_) {
                    return AddNewCustomerDialog(
                        refreshDataCustomer: widget.refreshDataCustomers);
                  })
                },
                text: 'Add Customer',
                backgroundColor: const Color.fromRGBO(19, 102, 217, 1),
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
