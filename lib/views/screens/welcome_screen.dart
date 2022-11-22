import 'dart:async';

import 'package:e_commerce/helper/constants/app_colors.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
   double height = 100;
  double width = 100;
  double radius = 100;
  double position =  1;
  double opacity = 0;
  double btnOpacity = 0;
  @override
  void initState() {
   animateContainer(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox.expand(
        child: Center(
          child: Stack(

            children: [
              AnimatedContainer(
                height: height,
                width: width,
                 padding: const EdgeInsets.all(20),
                 alignment: Alignment.center,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.linearToEaseOut,
                decoration:  BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(radius),
                ),
              child: Image.asset('images/lgo.png',height: 80,width: 80,),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height/2+80,
                  left: MediaQuery.of(context).size.width/2-75,
                  child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 2000),
                      curve: Curves.linearToEaseOut,
                      opacity:opacity,
                      child: Container(
                          width: 150,
                          alignment: Alignment.center,
                          child: const Text('APP NAME',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)))),
              Positioned(
                  top: MediaQuery.of(context).size.height/2+120,
                  left: MediaQuery.of(context).size.width/2-150,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.linearToEaseOut,
                    opacity:opacity,
                    child: Container(
                           width: 300,
                        alignment: Alignment.center,
                        child: const Text('Description About The App',style:  TextStyle(color: appGrey),)),
                  ),),
              Positioned(
                bottom: MediaQuery.of(context).size.height*0.1,
                left: MediaQuery.of(context).size.width/2-65,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.linearToEaseOut,
                  opacity:btnOpacity,
                  child: MaterialButton(
                    color: appGrey,
                    height: 45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: (){ Get.offNamed(signupScreen);},
                    child: const Text('GET STARTED',style: TextStyle(color: mainColor),),
                  ),
                ),),


            ],
          ),
        ),
      )
    );
  }
   animateContainer(BuildContext context){
     Timer(const Duration(milliseconds: 1500),(){

       setState(() {
          height = 80;
          width = 80;
       });

     });
     Timer(const Duration(milliseconds: 3000),(){

        setState(() {
          height = MediaQuery.of(context).size.height;
          width = MediaQuery.of(context).size.width;
          radius = 0;
        });

     });
     Timer(const Duration(milliseconds: 4000),(){

       setState(() {
         opacity = 1;
       });

     });
     Timer(const Duration(milliseconds: 5000,),(){
         setState(() {
           btnOpacity = 1;
         });
     });
   }
}
