import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../widgets/input_fields/search_field.dart';
import '../../widgets/lists/new_products.dart';
import '../../widgets/lists/promo_list.dart';
import '../../widgets/lists/search_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Discover',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              Text(
                'Find anything what you want',
                style: TextStyle(color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(flex: 11, child: SearchField(controller: productController,)),
                  Expanded(
                      child: IconButton(
                          splashRadius: 2,
                          onPressed: () {},
                          icon: const Icon(
                            Ionicons.filter_outline,
                            color: mainColor,
                            size: 30,
                          )))
                ],
              ),
              Obx(
                 () {
                  return SizedBox(
                      height: 600,
                      child:productController.searchList.isEmpty && productController.textEditingController.text.isEmpty ? ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          seeAll(title: 'Promotions'),
                          SizedBox(height: 180, child: PromotionProductsList(productController: productController,)),
                          seeAll(title: 'New Products'),
                          SizedBox(
                            height: 180,
                            child: NewProductsList(productController: productController,),
                          ),
                          seeAll(title: 'Popular'),
                          SizedBox(height: 180, child: PromotionProductsList(productController: productController,)),
                         SizedBox(height:60 ,)
                        ],
                      ):searchListView(productController: productController)
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding seeAll({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(color: mainColor, fontSize: 20),
          ),
          const Text(
            'see all',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          )
        ],
      ),
    );
  }
}

