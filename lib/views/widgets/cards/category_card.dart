import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:e_commerce/views/screens/category_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
   CategoryCard({
    Key? key, required this.title,  required this.image,
  }) : super(key: key);
  final String title ;
  final String image;
  ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (context) {
        return GestureDetector(
          onTap:()async{
             await productController.getProductsByCategory(title);
            Get.to(()=>CategoryProductsScreen(title: title,));

          },
          child: Container(
            height: 100,
            margin: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration:  BoxDecoration(

                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: 'images/loading2.gif',
                      image: image,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(title,style: const TextStyle(fontSize:30,color: Colors.white),),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
