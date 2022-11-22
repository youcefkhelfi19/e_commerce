import 'package:e_commerce/logic/bindings/auth_binding.dart';
import 'package:e_commerce/logic/bindings/main_screen_binding.dart';
import 'package:e_commerce/logic/bindings/product_binding.dart';
import 'package:e_commerce/views/screens/auth_screens/login_screen.dart';
import 'package:e_commerce/views/screens/auth_screens/new_password.dart';
import 'package:e_commerce/views/screens/auth_screens/reset_password.dart';
import 'package:e_commerce/views/screens/auth_screens/signup_screen.dart';
import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:e_commerce/views/screens/main_screen.dart';
import 'package:e_commerce/views/screens/splash_screen.dart';
import 'package:e_commerce/views/screens/welcome_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../views/screens/auth_screens/otp_screen.dart';
const String splashScreen = '/splash';
const String welcomeScreen = '/welcome';
const String loginScreen = '/login';
const String signupScreen = '/signup';
const String resetPassword = '/reset_password';
const String otpScreen = '/otp';
const String newPassword = '/newPassword';
const String mainScreen = '/main';
const String cartScreen = '/cart';
const String detailsScreen = '/details';



final List<GetPage> appPages = [
  GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      transitionDuration:
      const Duration(milliseconds: 500),
      curve: Curves.linear,
      transition: Transition.fade,
     bindings: [ProductBindings()]

  ),
  GetPage(
      name: welcomeScreen,
      page: () => const WelcomeScreen(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.fade,

  ),
  GetPage(
      name: cartScreen,
      page: () =>  Cart(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.rightToLeft,

  ),

  GetPage(name: loginScreen, page: () =>  LoginScreen(),
      transitionDuration:
      const Duration(milliseconds: 500),
      curve: Curves.linear,
      transition: Transition.downToUp,
      binding: AuthBinding(),

  ),
  GetPage(name: signupScreen, page: () =>  SignupScreen(),
      transitionDuration:
      const Duration(milliseconds: 500),
      curve: Curves.linear,
      transition: Transition.downToUp,
      bindings: [AuthBinding(),ProductBindings()],
  ),
  GetPage(name: resetPassword, page: () =>   ResetPassword(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.leftToRight,
  ),
  GetPage(name: otpScreen, page: () =>  const OTPScreen(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.leftToRight,
  ),
  GetPage(name: newPassword, page: () =>  const NewPassword(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.leftToRight,
  ),
  GetPage(name: mainScreen, page: () =>   MainScreen(),
    transitionDuration:
    const Duration(milliseconds: 500),
    curve: Curves.linear,
    transition: Transition.fade,
    bindings: [AuthBinding(),MainScreenBinding(),ProductBindings()
    ]
  )


];
