import 'package:flutter/material.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({super.key});

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
              SizedBox(
                width: 120,
                child: Text(
                  'Products',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  'Buying Price',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  'Quantity',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  'Threshold Value',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 120,
                child: Text(
                  'Expiry Date',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 80,
                child: Text(
                  'Availability',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const SeparatorHorizontal(),
      ],
    );
  }
}
