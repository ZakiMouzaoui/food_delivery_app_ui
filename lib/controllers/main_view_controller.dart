import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/screens/home/home_screen.dart';
import 'package:food_delivery_app_ui/screens/menu_screen/menu_screen.dart';
import 'package:food_delivery_app_ui/screens/more_screen/more_screen.dart';
import 'package:food_delivery_app_ui/screens/offers/latest_offers.dart';
import 'package:food_delivery_app_ui/screens/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class MainViewController extends GetxController{
  RxInt currentIndex = 2.obs;

  List<Widget> pages = [
    MenuScreen(),
    const LatestOffers(),
    HomeScreen(),
    ProfileScreen(),
    const MoreScreen()
  ];

  void changeIndex(int newIndex){
    currentIndex.value = newIndex;
  }
}