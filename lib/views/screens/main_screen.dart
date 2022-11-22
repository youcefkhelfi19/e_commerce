import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/main_screen_controller.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../widgets/buttons/cart_button.dart';


class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainScreenController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true ,
            appBar: AppBar(
              elevation: 0.0,
              title: Text(mainController.titles[mainController.tabIndex.value],style: const TextStyle(
                color: mainColor,
                fontSize: 25
              ),),
              actions: [
                IconButton(onPressed: (){

                },
                    icon: const Icon(Ionicons.notifications_outline, color: mainColor,)),
                CartBadge(),
              ],
            ),
            body:IndexedStack(
              index: mainController.tabIndex.value,
              children: mainController.tabs,
            ),
            bottomNavigationBar: FloatingNavbar(
              unselectedItemColor:Colors.grey.shade400,
              selectedItemColor: mainColor,
              selectedBackgroundColor: Colors.transparent,
              backgroundColor: Get.isDarkMode?darkColor:Colors.white,
              borderRadius: 20,
              onTap:(index){
                mainController.tabIndex.value = index;
              },
              itemBorderRadius: 15,
              currentIndex: mainController.tabIndex.value,
              items: [
                FloatingNavbarItem(icon: Ionicons.storefront_outline),
                FloatingNavbarItem(icon: Ionicons.grid_outline),
                FloatingNavbarItem(icon: Ionicons.heart_outline),
                FloatingNavbarItem(icon: Ionicons.person_outline),
              ],
            )

        );
      }
    );
  }
}

