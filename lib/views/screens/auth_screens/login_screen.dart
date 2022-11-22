import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:e_commerce/views/widgets/buttons/custom_simple_btn.dart';
import 'package:e_commerce/views/widgets/input_fields/input_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_strings.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../../widgets/input_fields/password_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey  = GlobalKey();
   final controller = Get.find<AuthController>();
   TextEditingController emailController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: SizedBox(
        height: 40,
        child: Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
                text:  'You don\'n have an account? ',
                style:const TextStyle(color:Colors.black ,fontSize: 16),
                children: <TextSpan>[
                  TextSpan(text:  'Sign Up',
                      style:const TextStyle(color: mainColor,fontSize: 16),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () { Get.offNamed(signupScreen);}
                  )
                ]
            ),
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.15,),

              RichText(
                text:  const TextSpan(
                  text: "LET'S ",
                  style:  TextStyle(color: Colors.black,fontSize: 35),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'LOGIN',
                        style:   TextStyle(color: mainColor,fontSize: 35)),
                  ],
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height*0.1,),
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
              PasswordTextField(
                textController: passwordController,
                hint: 'Password', icon: Ionicons.lock_closed_outline,
              validator: (value){
                if(value.toString().length<6){
                  return 'Short password';
                }else{
                  return null;
                }
              },
              ),

               Align(
                alignment: Alignment.topRight,
                child:  TextButton(onPressed: () {Get.toNamed(resetPassword);},
                child: const Text('Forget password',style:   TextStyle(color: Colors.black,fontSize: 16),)),
              ) ,
              const SizedBox(height: 30,),
               GetBuilder<AuthController>(
                builder: (context) {
                  return CustomSimpleBtn(title: 'LOGIN',
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          controller.login(email: emailController.text.trim(), password: passwordController.text);
                        }
                  });
                }
              ),
              const SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}
