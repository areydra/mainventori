import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class SupplierList extends StatelessWidget {
  final List<Supplier> suppliers;

  const SupplierList({
    Key? key,
    required this.suppliers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SeparatorHorizontal(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Supplier Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 110,
                    child: Text(
                      'Contact Number',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SeparatorHorizontal(),
          Expanded(
            child: ListView.builder(
              itemCount: suppliers.length,
              itemBuilder: (context, index) {
                final supplier = suppliers[index];
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              supplier.name,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(72, 80, 94, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 110,
                              child: Text(
                                supplier.contactNumber,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(72, 80, 94, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              supplier.email,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(72, 80, 94, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: index < (suppliers.length - 1),
                      child: const SeparatorHorizontal(),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
