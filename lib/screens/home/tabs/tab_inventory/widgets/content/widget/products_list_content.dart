import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mainventori/database/index.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductsListContent extends StatefulWidget {
  final List<Product> products;

  const ProductsListContent({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<ProductsListContent> createState() => _ProductsListContentState();
}

class _ProductsListContentState extends State<ProductsListContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120,
                      child: Text(
                        widget.products[index].name,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Rp${NumberFormat.decimalPattern('id').format(widget.products[index].buyingPrice)}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(
                        '${widget.products[index].quantity} ${widget.products[index].unit}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        '${widget.products[index].thresholdValue} ${widget.products[index].unit}',
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: Text(
                        widget.products[index].expiryDate,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(72, 80, 94, 1),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: widget.products[index].quantity == 0
                          ? const Text(
                              'Out of stock',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(218, 62, 51, 1),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : widget.products[index].quantity < 10
                              ? const Text(
                                  'Low stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(225, 145, 51, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              : const Text(
                                  'In stock',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(16, 167, 96, 1),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: index < (widget.products.length - 1),
                child: const SeparatorHorizontal(),
              )
            ],
          );
        },
      ),
    );
  }
}
