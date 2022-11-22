import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/cards/cart_item_card.dart';
import '../widgets/cards/total_card.dart';
const String img = 'https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80';
class Cart extends StatelessWidget {
   Cart({Key? key}) : super(key: key);
   final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text('Cart',style: TextStyle(
            color: mainColor,
            fontSize: 25
        ),),
        actions: [IconButton(onPressed: (){cartController.clearCart();},
            icon: const Icon(Ionicons.bag_remove_outline,color: mainColor,))],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Obx((){
              if( cartController.cartList.isEmpty){
                return  Center(child: Image.asset('images/cart.png',height: 200,width: 200,),);
              }
              return ListView.builder(
                itemCount: cartController.cartList.length,
                  itemBuilder: (context,index){
                    return CartItemCard(
                        product: cartController.cartList.keys.toList()[index],
                        index: index);

              });
            })
          ),
          Expanded(
              child: TotalCard()),
         const SizedBox(height: 20,)
        ],
      ),
    );
  }
}


