import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:e_commerce/views/widgets/buttons/custom_simple_btn.dart';
import 'package:e_commerce/views/widgets/input_fields/input_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_strings.dart';
import '../../widgets/input_fields/otp_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
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
                text: "VERIFY ",
                style:  TextStyle(color: Colors.black,fontSize: 35),
                children: <TextSpan>[
                  TextSpan(
                      text: 'OTP',
                      style:   TextStyle(color: mainColor,fontSize: 35)),
                ],
              ),
            ),
            const SizedBox(height: 150,),
            const OTPField(),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){},
                child: const Text('Resend code',style: TextStyle(color: mainColor,fontSize: 16),),
              ),
            ),

            const SizedBox(height: 30,),

            CustomSimpleBtn(title: 'VERIFY', onTap: (){Get.toNamed(newPassword);}),


          ],
        ),
      ),
    );
  }
}
