import 'package:e_commerce/views/widgets/cards/favotrites_card.dart';
import 'package:e_commerce/views/widgets/lists/favorit_products_list.dart';
import 'package:e_commerce/views/widgets/shimmers/vertical_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../logic/controllers/product_controller.dart';
import '../../widgets/shimmers/shimmer_container.dart';

class Favorites extends StatelessWidget {
   Favorites({Key? key}) : super(key: key);
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SizedBox(
        height: 800,
        width: MediaQuery.of(context).size.width,
        child: Obx((){
          if(productController.favoritesProducts.isEmpty){
            return  Center(
              child: Image.asset('images/empty.png',height: 600,width: 400,),
            );
          }else {
            return  ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: productController.favoritesProducts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index){
                  return   FavoritesCard(product: productController.favoritesProducts[index],
                  );
                });
        }

        }),
      ),
    );
  }
}

