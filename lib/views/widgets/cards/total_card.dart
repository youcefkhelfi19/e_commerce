import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/constants/app_colors.dart';
import '../../../logic/controllers/cart_controller.dart';

class TotalCard extends StatelessWidget {
  TotalCard({
    Key? key,
  }) : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(

          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Total',style:  TextStyle(fontSize: 18,color: Colors.grey),),

                  Text(cartController.cartList.isEmpty? '0.00':cartController.productsTotal,style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

                ],
              ),
              MaterialButton(
                color: mainColor,
                height: 40,
                minWidth: 100,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onPressed:(){},
                child: const Text('Check Out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        );
      }
    );
  }
}
