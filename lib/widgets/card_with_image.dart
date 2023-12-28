import 'package:flutter/material.dart';

class CardWithImage extends StatelessWidget {
  final AssetImage image;
  final String title;
  final String description;
  final bool isShowStatus;

  const CardWithImage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.isShowStatus,    
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Image(
          image: image,
          width: 60,
          height: 70,
        ),
        const SizedBox(width: 26),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(width: 26),
        Visibility(
          visible: isShowStatus,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(254, 236, 235, 1),
            ),
            child: const Text(
              'Low',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(170, 48, 40, 1),
              ),
            ),
          ),     
        )
      ]
    );
  }
}