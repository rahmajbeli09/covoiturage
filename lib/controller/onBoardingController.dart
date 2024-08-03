import 'package:covo/core/constant/routes.dart';
import 'package:covo/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onboardingcontroller extends GetxController{
  next();
  onPageChanged(int index);
  skip();
}
class OnboardingcontrollerImp extends Onboardingcontroller {
  
  late PageController pageController;
  int currentPage = 0 ;
  @override
  next() {
    currentPage++;
    if(currentPage >onBoardingList.length -1){
        Get.offAllNamed(AppRoute.login);
    }else{
          pageController.animateToPage(currentPage, duration: const Duration(microseconds: 900), curve: Curves.easeInOut);

    }
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
  
  @override
  skip() {
    Get.offAllNamed(AppRoute.login);
  }
  
}