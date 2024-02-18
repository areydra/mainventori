import 'package:flutter/material.dart';

class AddNewProductDialogHeader extends StatelessWidget {
  const AddNewProductDialogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 40),
        Row(children: [
          SizedBox(
            width: 140,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Kode Produk'),
            ),
          ),
          SizedBox(
            width: 210,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Nama Produk'),
            ),
          ),
          SizedBox(
            width: 160,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Kategori'),
            ),
          ),
          SizedBox(
            width: 160,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Supplier'),
            ),
          ),
          SizedBox(
            width: 200,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Harga Beli'),
            ),
          ),
          SizedBox(
            width: 110,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Jumlah Stok'),
            ),
          ),
          SizedBox(
            width: 110,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Min Stock'),
            ),
          ),
          SizedBox(
            width: 110,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Unit'),
            ),
          ),
          SizedBox(
            width: 210,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Tanggal Masuk'),
            ),
          ),
        ]),
        SizedBox(height: 4),
      ],
    );
  }
}
