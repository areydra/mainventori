import 'package:flutter/material.dart';
import 'package:mainventori/screens/home/tabs/tab_suppliers/widgets/dialog_supplier_fields.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class SuppliersStock {
  String name;
  String contactNumber;
  String email;

  SuppliersStock({
    required this.name,
    required this.contactNumber,
    required this.email,
  });
}

List<SuppliersStock> products = [
  SuppliersStock(
    name: 'Bura',
    contactNumber: '62866219304',
    email: 'bura@gmail',
  ),
  SuppliersStock(
    name: 'Bursa',
    contactNumber: '62866219305',
    email: 'bursa@gmail',
  ),
  SuppliersStock(
    name: 'Buara',
    contactNumber: '62866219307',
    email: 'buara@gmail',
  ),
  SuppliersStock(
    name: 'Burvv',
    contactNumber: '62866219308',
    email: 'burvv@gmail',
  ),
  SuppliersStock(
    name: 'Buraax',
    contactNumber: '62866219309',
    email: 'buraax@gmail',
  ),
  SuppliersStock(
    name: 'Buracc',
    contactNumber: '62866219310',
    email: 'buracc@gmail',
  ),
];

class Suppliers extends StatelessWidget {
  const Suppliers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 23),
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
                        child: const Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/search.png'),
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search supplier',
                                    hintStyle:
                                        TextStyle(fontSize: 16, height: 2.8)),
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
                            return const DialogSupplierFields();
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
          ),
          const SeparatorHorizontal(),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      'Supplier Name',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(102, 112, 133, 1),
                          fontWeight: FontWeight.w500),
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
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: 120,
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(102, 112, 133, 1),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const SeparatorHorizontal(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                products[index].name,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(72, 80, 94, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 110,
                              child: Text(
                                products[index].contactNumber,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(72, 80, 94, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                products[index].email,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(72, 80, 94, 1),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                      visible: index < (products.length - 1),
                      child: const SeparatorHorizontal(),
                    )
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(208, 211, 217, 1)))),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(72, 80, 94, 1)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 26))),
                    onPressed: () {
                      // put your code here
                      // print("heello dere");
                    },
                    child: const Text(
                      'Previous',
                      style: TextStyle(fontSize: 14),
                    )),
                const Text('Page 1 of 10'),
                TextButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                        color:
                                            Color.fromRGBO(208, 211, 217, 1)))),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(72, 80, 94, 1)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 26))),
                    onPressed: () {
                      // put your code here
                      // print("heello dere");
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 14),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
