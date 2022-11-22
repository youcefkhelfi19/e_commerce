import 'package:e_commerce/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../helper/constants/app_colors.dart';

class PasswordTextField extends StatelessWidget {
   PasswordTextField({Key? key, required this.hint, required this.icon,  this.textController, this.validator}) : super(key: key);
  final String hint ;
  final IconData icon;
  final Function? validator;
  final TextEditingController? textController;
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextFormField(
            controller:textController,
            obscureText: controller.isVisible?true:false,
            validator: (value)=>validator!(value),
            decoration: InputDecoration(
              hintText: hint,

              hintStyle: const TextStyle(color: Colors.grey),
              label:  Text(hint,style: const TextStyle(color: mainColor),),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              filled: true,
              fillColor: appGrey,
              focusColor: appGrey,
              prefixIcon:  Icon(icon,color: mainColor,size: 25,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,

              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,

              ),
           suffixIcon: IconButton(
             splashRadius: 1,
             onPressed: (){controller.visibility();},
             icon: controller.isVisible?const Icon(Ionicons.eye_off_outline,color: Colors.grey,):const Icon(Ionicons.eye_outline,color: mainColor,),
           )
            ),
          ),
        );
      }
    );
  }
}
