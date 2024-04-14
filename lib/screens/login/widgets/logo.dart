import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logos/mawavi.png'),
          width: 360,
          height: 250,
        ),
        Text(
          'MaInventori',
          style: TextStyle(
            fontSize: 47,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(0, 158, 216, 1),
          ),
        )
      ],
    );
  }
}
