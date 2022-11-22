import 'package:flutter/material.dart';

import '../../../helper/constants/app_colors.dart';

class CustomSimpleBtn extends StatelessWidget {
  const CustomSimpleBtn({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
        height: 45,
        minWidth: double.infinity,
        color: mainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child:  Text(title,style:  const TextStyle(color: Colors.white,fontSize: 18),),
        onPressed: ()=>onTap());
  }
}
