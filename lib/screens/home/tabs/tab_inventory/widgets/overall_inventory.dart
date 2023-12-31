import 'package:flutter/material.dart';
import 'package:mainventori/widgets/separator_vertical.dart';

class OverallInventory extends StatelessWidget {
  const OverallInventory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overall Inventory',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 22),
          Row(
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(21, 112, 239, 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '14',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1),
                      ),
                    )
                  ],
                )                          
              ),
              SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(225, 145, 51, 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '868',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1),
                      ),
                    )
                  ],
                )                          
              ),
              SeparatorVertical(),
              SizedBox(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Low Stocks',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(243, 105, 96, 1),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '12',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(93, 102, 121, 1),
                      ),
                    )
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