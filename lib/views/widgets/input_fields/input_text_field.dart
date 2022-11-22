import 'package:flutter/material.dart';

import '../../../helper/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint, required this.icon,  this.controller, this.validator}) : super(key: key);
   final String hint ;
   final IconData icon;
   final Function? validator;
   final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller:controller,
        validator: (value)=>validator!(value),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          label:  Text(hint,style: const TextStyle(color: mainColor),),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          prefixIcon:  Icon(icon,color: mainColor,size: 25,),
          filled: true,
          fillColor: appGrey,
          focusColor: appGrey,
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

        ),
      ),
    );
  }
}
