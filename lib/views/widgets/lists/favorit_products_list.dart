import 'package:e_commerce/views/widgets/cards/favotrites_card.dart';
import 'package:e_commerce/views/widgets/shimmers/horizontal_shimmer_loading.dart';
import 'package:e_commerce/views/widgets/shimmers/vertical_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/product_controller.dart';
import '../cards/product_card.dart';

class FavoritesProductsList extends StatelessWidget {
  FavoritesProductsList({
    Key? key,}) : super(key: key);

  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(productController.favoritesProducts.isEmpty){
        return const VerticalShimmerLoading();
      }else{
        return  ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: productController.favoritesProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index){
              return  FavoritesCard(product: productController.favoritesProducts[index],
              );
            });
      }

    });
  }
}
