import 'package:flutter/material.dart';

class AddNewOrderDialogHeader extends StatelessWidget {
  const AddNewOrderDialogHeader({super.key});

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
            width: 200,
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(72, 80, 94, 1),
              ),
              child: Text('Harga'),
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
              child: Text('Harga Jual'),
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
              child: Text('Jumlah'),
            ),
          ),
        ]),
        SizedBox(height: 4),
      ],
    );
  }
}
