import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController{
  next();
  onPageChanged(int index);
}
class OnboardingcontrollerImp extends Onboardingcontroller {
  
  late PageController pageController;
  int currentPage = 0 ;
  @override
  next() {
    currentPage++;
    pageController.animateToPage(currentPage, duration: const Duration(microseconds: 900), curve: Curves.easeInOut);
  }

  @override
  onPageChanged(int index) {
    currentPage = index ;
    update();
    
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
  
}