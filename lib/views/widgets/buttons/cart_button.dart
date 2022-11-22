import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../helper/constants/app_routes.dart';
import '../../../logic/controllers/cart_controller.dart';

class CartBadge extends StatelessWidget {
  CartBadge({
    Key? key,
  }) : super(key: key);
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          return Badge(
            elevation: 0.0,
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topEnd(top: 5, end: 10),
            badgeColor:cartController.cartList.isEmpty?Colors.transparent :mainColor,

            badgeContent: Text(cartController.cartList.isNotEmpty?'${cartController.cartList.length}':'',style: TextStyle(color: Colors.white),),
            child: IconButton(
              icon:  const Icon(Ionicons.cart_outline,color: mainColor,),
              onPressed: () {Get.toNamed(cartScreen);},
            ),
          );
        }
    );
  }
}