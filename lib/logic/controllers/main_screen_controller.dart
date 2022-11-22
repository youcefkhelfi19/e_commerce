import 'package:e_commerce/views/screens/cart_screen.dart';
import 'package:e_commerce/views/screens/btm_navigation_bar_tabs/catrgories.dart';
import 'package:e_commerce/views/screens/btm_navigation_bar_tabs/favorites.dart';
import 'package:e_commerce/views/screens/btm_navigation_bar_tabs/home.dart';
import 'package:e_commerce/views/screens/btm_navigation_bar_tabs/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController{
  RxInt tabIndex = 0.obs;

  List<Widget>  tabs = [
     Home(),
     Categories(),
     Favorites(),
     Profile(),
  ].obs;
  List<String> titles = [
    'AppName',
    'Categories',
    'Favorites',
    'Profile',
  ];
}