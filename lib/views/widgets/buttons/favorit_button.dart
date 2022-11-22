import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../logic/controllers/product_controller.dart';

class FavoritButton extends StatelessWidget {
   FavoritButton({
    Key? key,
   required this.id, this.size = 30,
  }) : super(key: key);

  final ProductController controller = Get.find<ProductController>();
  final int id;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Obx(
            (){
        return InkWell(
            onTap: () {
              controller.manageFavorites(id);
            },
            child: controller.isFavorit(id)
                ?  Icon(
              Ionicons.heart,
              color: mainColor,
              size: size,
            )
                :  Icon(
              Ionicons.heart_outline,
              color: mainColor,
              size: size,
            ));
      }
    );
  }
}
