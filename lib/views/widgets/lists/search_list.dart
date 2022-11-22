import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../logic/controllers/product_controller.dart';
import '../cards/product_card.dart';

class searchListView extends StatelessWidget {
  const searchListView({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20,bottom: 10),
          child: Text(
            'Result',
            style: TextStyle(color: mainColor, fontSize: 20),
          ),
        ),
        SizedBox(
            height: 540,
            child: GetBuilder<ProductController>(
                builder: (context) {
                  print(productController.textEditingController.text);
                  if(productController.searchList.isEmpty){
                    return Center(
                      child:  Image.asset('images/nr.png',height: 200,width: 200,),
                    );

                  }else{
                    return GridView.builder(
                        itemCount: productController.searchList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 5),
                        itemBuilder: (_, index) => ProductCard(
                          product:
                          productController.searchList[index], productController: productController,
                        ));
                  }
                }
            )
        ),
      ],
    );
  }
}
