import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/separator_horizontal.dart';

class ProductListHeader extends ConsumerWidget {
  const ProductListHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userStore.notifier.select((value) => value.user));

    return Column(
      children: [
        const SeparatorHorizontal(),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 135,
                child: Text(
                  'Kode Produk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 220,
                child: Text(
                  'Nama Produk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 165,
                child: Text(
                  'Harga Beli',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 165,
                child: Text(
                  'Jumlah Stok',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 165,
                child: Text(
                  'Min Stok',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 220,
                child: Text(
                  'Tanggal Masuk',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 165,
                child: Text(
                  'Ketersediaan',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(102, 112, 133, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Visibility(
                visible: user!.isAdmin,
                child: const SizedBox(width: 100),
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
