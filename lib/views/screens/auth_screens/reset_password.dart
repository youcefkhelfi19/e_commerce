import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:e_commerce/views/widgets/buttons/custom_simple_btn.dart';
import 'package:e_commerce/views/widgets/input_fields/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_strings.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey  = GlobalKey();
  final controller = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 150,),

              RichText(
                text:  const TextSpan(
                  text: "RESET ",
                  style:  TextStyle(color: Colors.black,fontSize: 35),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'PASSWORD',
                        style:   TextStyle(color: mainColor,fontSize: 35)),
                  ],
                ),
              ),
              const SizedBox(height: 150,),
              CustomTextField(
                controller: emailController,
                hint: 'Email', icon: Ionicons.mail_outline,
                validator: (value){
                  if(value.toString().length<=3 || !RegExp(validationEmail).hasMatch(value) ){
                    return 'use a validate email';
                  }else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: 50,),

              GetBuilder<AuthController>(
                builder: (context) {
                  return CustomSimpleBtn(
                      title: 'SEND',
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          controller.resetPassword(email: emailController.text.trim());
                        }
                      });
                }
              ),


            ],
          ),
        ),
      ),
    );
  }
}
