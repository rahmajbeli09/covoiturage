import 'package:covo/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboardingbutton extends GetView<OnboardingcontrollerImp> {
  const Onboardingbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
                           color:  Color.fromARGB(255, 211, 150, 19),
            ),
            child: MaterialButton(
            onPressed: (){
              controller.next();
            },
            child:const  Text("Suivant", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" ))
           ),);
  }
}