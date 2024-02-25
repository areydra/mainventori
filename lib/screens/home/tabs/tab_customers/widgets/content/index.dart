import 'package:flutter/material.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/screens/home/tabs/tab_inventory/widgets/content/widget/footer.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class Content extends StatelessWidget {
  final List<Customer> customers;
  final int currentPageNumber;
  final int totalPageNumber;
  final Function getItemsPerPage;
  final String searchQuery;

  const Content({
    Key? key,
    required this.customers,
    required this.currentPageNumber,
    required this.totalPageNumber,
    required this.getItemsPerPage,
    required this.searchQuery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    'Customer Name',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
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
                  child: Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(102, 112, 133, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: Text(
                    'Address',
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
            itemCount: customers.length,
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
                              customers[index].name,
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
                              customers[index].contactNumber,
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
                              customers[index].email,
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
                              customers[index].address,
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
                    visible: index < (customers.length - 1),
                    child: const SeparatorHorizontal(),
                  )
                ],
              );
            },
          ),
        ),
        Footer(
          currentPage: currentPageNumber,
          totalPage: totalPageNumber,
          onPressNextPage: () {
            if ((currentPageNumber + 1) < totalPageNumber) {
              getItemsPerPage(currentPageNumber + 1, searchQuery);
            }
          },
          onPressPreviousPage: () {
            if (currentPageNumber > 0) {
              getItemsPerPage(currentPageNumber - 1, searchQuery);
            }
          },
        ),
      ],
    );
  }
}
