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
                width: 135,
                child: Text(
                  'Kode Produk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  'Nama Produk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 165,
                child: Text(
                  'Harga Beli',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 165,
                child: Text(
                  'Jumlah Stok',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 165,
                child: Text(
                  'Min Stok',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 220,
                child: Text(
                  'Tanggal Masuk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 165,
                child: Text(
                  'Ketersediaan',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 100),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const SeparatorHorizontal(),
      ],
    );
  }
}
