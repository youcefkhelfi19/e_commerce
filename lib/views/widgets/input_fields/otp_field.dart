import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helper/constants/app_colors.dart';

class OTPField extends StatelessWidget {
  const OTPField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customOtpField(),
        customOtpField(),
        customOtpField(),
        customOtpField(),
        customOtpField(),


      ],
    );
  }

  Expanded customOtpField() {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: mainColor,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),

            ],
            autofocus: false,
            textAlign: TextAlign.center,
            decoration: InputDecoration(

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
        ),
      );
  }
}
