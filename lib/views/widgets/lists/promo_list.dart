import 'package:e_commerce/views/widgets/shimmers/horizontal_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../cards/product_card.dart';

class PromotionProductsList extends StatelessWidget {
const  PromotionProductsList({
    Key? key, required this.productController,}) : super(key: key);

  final ProductController productController ;

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(productController.products.isEmpty){
        return const ShimmerLoading();
      }else{
        return  ListView.builder(
            physics: const BouncingScrollPhysics(),

            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return  ProductCard(product: productController.products[index],
                isPromo: true, productController: productController,
              );
            });
      }

    });
  }
}
