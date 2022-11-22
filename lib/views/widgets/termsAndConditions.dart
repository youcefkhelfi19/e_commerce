import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants/app_colors.dart';

class TermsAndConditions extends StatelessWidget {
   TermsAndConditions({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: (){
                controller.acceptTerms();
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10,top: 10),
                height: 20,
                width: 20,
                decoration:  BoxDecoration(
                  color: appGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: controller.isAccepted?const Icon(Icons.check,size: 20,color: mainColor,):null,
              ),
            ),
            RichText(
              text:   TextSpan(
                text: "I accept ",
                style:  TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 16),
                children: const <TextSpan>[
                  TextSpan(

                      text: 'Terms & Conditions',
                      style:   TextStyle(color: mainColor,fontSize: 16,)),


                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
