import 'package:flutter/material.dart';

class ProductOrdersContentHeader extends StatelessWidget {
  const ProductOrdersContentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              'ID',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              'Customer',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              'Produk',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              'Total Belanja',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 150,
            child: Text(
              'Tanggal Pengiriman',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(102, 112, 133, 1),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 100,
          )
        ],
      ),
    );
  }
}
