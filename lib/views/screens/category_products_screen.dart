import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/buttons/cart_button.dart';
import '../widgets/cards/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
   CategoryProductsScreen({Key? key, this.title}) : super(key: key);
   final String? title ;
   ProductController productController = Get.find<ProductController>();

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title!,style: const TextStyle(color: mainColor),),
        actions: [
          CartBadge()
        ],
      ),
      body: GetBuilder<ProductController>(
          builder: (context){
            print(productController.categoryProducts.length);
            return SizedBox.expand(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  itemCount: productController.categoryProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 5),
                  itemBuilder: (_, index) => ProductCard(
                    product:
                    productController.categoryProducts[index],
                    productController: productController,
                  )),
            );
          }
      ),
    );
  }
}
