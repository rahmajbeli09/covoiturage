import 'package:covo/controller/onBoardingController.dart';
import 'package:covo/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dotcontroller extends StatelessWidget {
  const Dotcontroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnboardingcontrollerImp>
    (builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ...List.generate(onBoardingList.length , 
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                duration: const Duration(microseconds: 900),
              width: controller.currentPage==index ? 20 :6 ,
              height: 6,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 150, 19),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),))
           ],));
  }
}