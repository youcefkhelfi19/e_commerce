import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';

class SearchField extends StatelessWidget {
    SearchField({Key? key, required this.controller,}) : super(key: key);
   final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextField(
            controller: controller.textEditingController,
            onChanged: (value){
              controller.searchProduct(value);
            },
            decoration: InputDecoration(
              hintText: 'Search here',
              suffix: GestureDetector(
                  onTap: (){
                controller.textEditingController.clear();
                    controller.clearSearchResult();
                  },
                  child: const Icon(Ionicons.close,color: mainColor,)),
              hintStyle: const TextStyle(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              prefixIcon:  const Icon(Ionicons.search_outline,color: mainColor,size: 25,),
              filled: true,
              fillColor: appGrey,
              focusColor: appGrey,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,

              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,

              ),

            ),
          ),
        );
      }
    );
  }
}
