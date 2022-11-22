import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:e_commerce/views/widgets/buttons/custom_simple_btn.dart';
import 'package:e_commerce/views/widgets/input_fields/input_text_field.dart';
import 'package:e_commerce/views/widgets/input_fields/password_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_strings.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../../widgets/buttons/custom_icon_btn.dart';
import '../../widgets/termsAndConditions.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey  = GlobalKey();
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
        text:  'Already have an account? ',
            style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black ,fontSize: 16),
            children: <TextSpan>[
              TextSpan(text:  'Login',
                  style:const TextStyle(color: mainColor,fontSize: 16),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { Get.offNamed(loginScreen);}
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(

                    onTap: (){},
                    child: const Text('SKIP',style: TextStyle(color: mainColor),),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                RichText(
                  text:   TextSpan(
                    text: "LET'S ",
                     style:  TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 35),
                    children: const <TextSpan>[
                        TextSpan(
                          text: 'SIGN UP',
                          style:   TextStyle(color: mainColor,fontSize: 35)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                 CustomTextField(
                   controller: userNameController,
                   hint: 'Username', icon: Ionicons.person_outline,
                validator: (value){
                  if(value.toString().length<=3 || !RegExp(validationName).hasMatch(value) ){
                    return 'use a validate username';
                  }else{
                    return null;
                  }
                },
                ),
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
                     hint: 'Password',
                   icon: Ionicons.lock_closed_outline,
                   validator: (value){
                     if(value.toString().length<6  ){
                       return 'short password';
                     }else{
                       return null;
                     }
                   },
                 ),
                 TermsAndConditions(),
                const SizedBox(height: 30,),
                GetBuilder<AuthController>(
                  builder: (context) {
                    return CustomSimpleBtn(
                        title: 'SIGN UP',
                        onTap: () {
                             if(formKey.currentState!.validate()){
                                 if(controller.isAccepted == true){
                                   controller.singUp(
                                       username: userNameController.text.trim(),
                                       emailAddress: emailController.text.trim(),
                                       password: passwordController.text);
                                 }else {
                                   Get.snackbar('Oops!!', 'Accept Terms & Conditions',
                                       snackPosition: SnackPosition.BOTTOM,
                                       colorText: Colors.white,
                                       borderRadius: 20,
                                       backgroundColor: Colors.red
                                   );
                                 }
                             }
                        });
                  }
                ),
                const SizedBox(height: 30,),

                 Align(
                  alignment: Alignment.center,
                  child:  Text('-OR-',style:  TextStyle(color:Get.isDarkMode?Colors.white:Colors.black,fontSize: 20),),
                ) ,
                const SizedBox(height: 20,),

                Row(

                  children: [
                    Expanded(
                      child: GetBuilder<AuthController>(

                        builder: (context) {
                          return ButtonWithIcon(
                            color: Colors.red,
                            text: 'Google',
                            image: 'images/google.png',
                            onTap: (){
                              controller.googleSingIn();
                            },
                          );
                        }
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(

                      child: GetBuilder<AuthController>(
                        builder: (context) {
                          return ButtonWithIcon(
                            color: Colors.blue,
                            text: 'Facebook',
                            image: 'images/facebook.png',
                            onTap: (){
                              controller.facebookSingIn();
                            },
                          );
                        }
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

