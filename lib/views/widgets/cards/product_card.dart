import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../buttons/favorit_button.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
    this.isPromo = false, required this.productController,
  }) : super(key: key);
  final Product product;
  final bool isPromo;
  final cartController = Get.find<CartController>();
  final ProductController productController ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailsScreen(
          product: product,
        ));
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: appGrey, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 130,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'images/loading.gif',
                    image: product.image,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 5,
                  child: FavoritButton(id: product.id,),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: isPromo
                      ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        color: mainColor,
                      ),
                      child: const Text(
                        '30 %',
                        style:
                        TextStyle(color: Colors.white, fontSize: 12),
                      ))
                      : const SizedBox(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          product.title,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${product.price.toString()}DZD',
                        style:
                        const TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  AddToCartBtn(product: product,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddToCartBtn extends StatelessWidget {
  AddToCartBtn({
    Key? key,
    required this.product,
  }) : super(key: key);

  final CartController cartController = Get.find<CartController>();
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (context) {
          return InkWell(
              onTap: () {
                cartController.addToCart(product);
              },
              child: const Icon(
                Ionicons.add,
                color: mainColor,
              ));
        }
    );
  }
}
