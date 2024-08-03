import 'package:covo/controller/onBoardingController.dart';
import 'package:covo/view/widget/onBoarding/dotController.dart';
import 'package:covo/view/widget/onBoarding/onBoardingButton.dart';
import 'package:covo/view/widget/onBoarding/onBoardingSlider.dart';
import 'package:covo/view/widget/onBoarding/skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingcontrollerImp());
    return const Scaffold(
      body: SafeArea(child: Column(
        children: [
         Expanded(
            flex: 4,
            child:  onBoardingSlider(),
          ),
          SizedBox(height: 50,),
          Expanded(
            flex:1,
            child : Column(children: [
         Dotcontroller(),
           SizedBox(height: 20,),
           Onboardingbutton(),
          Skip()
         
            ],))
        ],
      ),
      ));
  }
}