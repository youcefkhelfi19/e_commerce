import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';

class FavoritesCard extends StatelessWidget {
   FavoritesCard({
    Key? key,  required this.product,
  }) : super(key: key);
 final Product product;
 final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(

            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20)
            ),
            child: Center(
              child: FadeInImage.assetNetwork(
                width: 80,
                height: 80,
                placeholder: 'images/loading.gif',
                fit: BoxFit.fill,
                image: product.image,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 SizedBox(
                   width:180,
                   child: Text(product.title,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style:  const TextStyle(color: Colors.black,fontSize: 18),),
                 ),
                Text('${product.price}DZD',style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    decoration: BoxDecoration(
                        color: appGrey,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text(product.rating.rate.toString(),style: const TextStyle(color: Colors.black,fontSize: 14),),
                        const SizedBox(width: 10,),
                        const Icon(Ionicons.star,size: 12,color: Colors.orange,)
                      ],
                    ))
              ],
            ),
          ),
          const Spacer(),
           Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () {
                return  InkWell(
                    onTap: (){productController.manageFavorites(product.id);},
                    child: productController.isFavorit(product.id)?const Icon(Ionicons.heart,color: mainColor,):const Icon(Ionicons.heart_outline,color: mainColor,));
              }
            ),
          )
        ],
      ),
    );
  }
}
