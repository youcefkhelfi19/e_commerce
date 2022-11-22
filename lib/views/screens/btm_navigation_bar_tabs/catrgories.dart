import 'package:e_commerce/logic/controllers/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cards/category_card.dart';

class Categories extends StatelessWidget {
   Categories({Key? key, }) : super(key: key);
  CategoriesController categoriesController = Get.find<CategoriesController>();

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:  SizedBox.expand(
        child: Obx(
          () {
            return ListView.builder(

                itemCount: categoriesController.categories.length,
                itemBuilder: (context,index){
                  return CategoryCard(
                    title: categoriesController.categories[index],
                    image: categoriesController.images[index],);
            });
          }
        ),
      )
    );
  }
}

