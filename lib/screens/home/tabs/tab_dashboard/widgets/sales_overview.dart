import 'package:flutter/material.dart';
import 'package:mainventori/widgets/separator_vertical.dart';

class SalesOverview extends StatelessWidget {
  const SalesOverview({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
      margin: const EdgeInsets.only(right: 22),
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
              'Sales Overview',
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
                            image: AssetImage('assets/icons/revenue.png'),
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'Revenue',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Text(
                      'Rp18.300.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              const SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(
                        children: [
                          Image(
                            image: AssetImage('assets/icons/cost.png'),
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'Cost',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Text(
                      'Rp17.432.000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              const SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: const Column(
                        children: [
                          Image(
                            image: AssetImage('assets/icons/profit.png'),
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'Profit',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    ),
                    const Text(
                      'Rp868.000',
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