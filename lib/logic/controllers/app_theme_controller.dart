import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeController{
  final GetStorage boxStorage = GetStorage();
  saveThemeDataStatus (bool themeDataStatus){
    boxStorage.write('isDark', themeDataStatus);

  }

  bool getThemeDataStatus(){
   return boxStorage.read<bool>('isDark')??false;
  }
  get themeMode => getThemeDataStatus()? ThemeMode.light:ThemeMode.dark;
  void themeSwitch(){
    getThemeDataStatus()?
    Get.changeThemeMode(ThemeMode.light):
    Get.changeThemeMode(ThemeMode.dark);
   saveThemeDataStatus(getThemeDataStatus());
  }
}