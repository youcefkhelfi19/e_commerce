import 'dart:async';

import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../helper/constants/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000),(){

      GetStorage().read('session') == 'active'? Get.offNamed(mainScreen) :Get.offNamed(welcomeScreen);
    });
    return Scaffold(
        body: SizedBox.expand(
          child:
          Center(
            child: Stack(
              children: [
                Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(20),

                    decoration: const BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset('images/lgo.png',height: 80,width: 80,)),
              ],
            ),
          ),
        ),
    );
  }
}
