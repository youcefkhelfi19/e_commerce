import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../logic/controllers/cart_controller.dart';
import '../../../models/product_model.dart';

class CartItemCard extends StatelessWidget {
  CartItemCard({
    Key? key, required this.product, required this.index,
  }) : super(key: key);
  final Product product;
  final CartController cartController = Get.find<CartController>();
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      height: 110,
      decoration: BoxDecoration(
        color: appGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius:  BorderRadius.circular(20),
              child: Center(
                child: FadeInImage.assetNetwork(
                  width: 100,
                  height: 100,
                  placeholder: 'images/loading.gif',
                  fit: BoxFit.fill,
                  image: product.image,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width:110,
                  child: Text(product.title,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style:  const TextStyle(color: Colors.black,fontSize: 14),),
                ),
                Text('${cartController.productSubTotal[index].toStringAsFixed(2)}DZD',style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),

              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){cartController.removeSingleFromCart(product);},
                    child: const Icon(Ionicons.close_circle_outline,color: mainColor,)),
                Container(
                  height: 30,
                  width: 100,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      InkWell(
                          onTap: (){
                            cartController.removeItemsFromCart(product);
                          },
                          child: const Icon(Ionicons.remove,color: Colors.white,size:23,)),
                      const VerticalDivider(color: Colors.white,),
                      Text(
                        (cartController.productSubTotal[index] / product.price).toStringAsFixed(0),style: const TextStyle(color: Colors.white),),
                      const VerticalDivider(color: Colors.white,),
                      InkWell(
                          onTap: (){
                            cartController.addToCart(product);
                          },
                          child: const Icon(Ionicons.add,color: Colors.white,size:23,)),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
