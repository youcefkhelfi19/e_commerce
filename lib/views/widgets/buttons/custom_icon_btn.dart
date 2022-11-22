import 'package:flutter/material.dart';

import '../../../helper/constants/app_colors.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({Key? key,required this.image,required this.color,required this.onTap,required this.text}) : super(key: key);
  final Color color;
  final String text ;
  final Function() onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 45,

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20.0),
      ),
      color:appGrey,
      onPressed:onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(image,
              height:25 ,
              width:25,
            ),
          ),

          Text(text,
            style: TextStyle(color: color,fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
