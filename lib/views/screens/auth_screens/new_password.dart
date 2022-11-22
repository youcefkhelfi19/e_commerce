import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:e_commerce/views/widgets/buttons/custom_simple_btn.dart';
import 'package:e_commerce/views/widgets/input_fields/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_strings.dart';
import '../../widgets/input_fields/password_field.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 150,),

            RichText(
              text:  const TextSpan(
                text: "NEW ",
                style:  TextStyle(color: Colors.black,fontSize: 35),
                children: <TextSpan>[
                  TextSpan(
                      text: 'PASSWORD',
                      style:   TextStyle(color: mainColor,fontSize: 35)),
                ],
              ),
            ),
            const SizedBox(height: 150,),
        PasswordTextField(hint: 'New Password', icon: Ionicons.lock_closed_outline,),
        PasswordTextField(hint: 'Re-Password', icon: Ionicons.lock_closed_outline,),


            const SizedBox(height: 50,),

            CustomSimpleBtn(title: 'RESET', onTap: (){Get.toNamed(otpScreen);}),

          ],
        ),
      ),
    );
  }
}
