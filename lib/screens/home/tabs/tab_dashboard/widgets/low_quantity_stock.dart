import 'package:flutter/material.dart';
import 'package:mainventori/widgets/card_with_image.dart';

class ProductLowQuantityStock{
  AssetImage image;
  String title;
  String description;
  bool isShowStatus;

  ProductLowQuantityStock({
    required this.image,
    required this.title,
    required this.description,
    required this.isShowStatus,
  });
}

List<ProductLowQuantityStock> products = [
  ProductLowQuantityStock(
    image: const AssetImage('assets/product_images/aqua_600ml.png'),
    title: 'Aqua 600ml',
    description: 'Remaining Quantity: 20 Carton',
    isShowStatus: true
  ),
  ProductLowQuantityStock(
    image: const AssetImage('assets/product_images/aqua_1500ml.png'),
    title: 'Aqua 1500ml',
    description: 'Remaining Quantity: 20 Carton',
    isShowStatus: true
  ),
  ProductLowQuantityStock(
    image: const AssetImage('assets/product_images/okky_jelly_big.png'),
    title: 'Oky Jelly Drink',
    description: 'Remaining Quantity: 20 Carton',
    isShowStatus: true
  ),
  ProductLowQuantityStock(
    image: const AssetImage('assets/product_images/teh_gelas.png'),
    title: 'Teh Rio',
    description: 'Remaining Quantity: 20 Carton',
    isShowStatus: true
  ),
  ProductLowQuantityStock(
    image: const AssetImage('assets/product_images/teh_rio.png'),
    title: 'Teh Gelas',
    description: 'Remaining Quantity: 20 Carton',
    isShowStatus: true
  ),
];

class LowQuantityStock extends StatelessWidget {
  const LowQuantityStock({ Key? key }) : super(key: key);

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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Low Quantity Stock',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(15, 80, 170, 1)
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: 
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                  return Column(children: [
                    CardWithImage(
                      image: products[index].image,
                      title: products[index].title,
                      description: products[index].description,
                      isShowStatus: products[index].isShowStatus,
                    ),
                    const SizedBox(height: 16),
                  ]);                   
              } 
            )          
          )
          // const CardWithImage(
          //   image: AssetImage('assets/product_images/aqua_600ml.png'),
          //   title: 'Aqua 600ml',
          //   description: 'Remaining Quantity: 20 Carton',
          //   isShowStatus: true
          // ),
          // const CardWithImage(
          //   image: AssetImage('assets/product_images/aqua_1500ml.png'),
          //   title: 'Aqua 1500ml',
          //   description: 'Remaining Quantity: 20 Carton',
          //   isShowStatus: true
          // ),
          // const CardWithImage(
          //   image: AssetImage('assets/product_images/okky_jelly_big.png'),
          //   title: 'Okky Jelly Big',
          //   description: 'Remaining Quantity: 20 Carton',
          //   isShowStatus: true
          // ),
          // const CardWithImage(
          //   image: AssetImage('assets/product_images/teh_gelas.png'),
          //   title: 'Teh Gelas',
          //   description: 'Remaining Quantity: 20 Carton',
          //   isShowStatus: true
          // ),
          // const CardWithImage(
          //   image: AssetImage('assets/product_images/teh_rio.png'),
          //   title: 'Teh Rio',
          //   description: 'Remaining Quantity: 20 Carton',
          //   isShowStatus: true
          // ),
        ],
      ),
    );
  }
}
