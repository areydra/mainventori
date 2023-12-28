import 'package:flutter/material.dart';

class InventorySummary extends StatelessWidget {
  const InventorySummary({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 22),
            child: const Text(
              'Inventory Summary',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(
                        children: [
                          Image(
                            image: AssetImage('assets/icons/quantity.png'),
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'Quantity in Hand',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Text(
                      '868',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(
                        children: [
                          Image(
                            image: AssetImage('assets/icons/sold.png'),
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'Sold',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Text(
                      '200',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}