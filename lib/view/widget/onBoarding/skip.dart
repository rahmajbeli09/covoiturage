import 'package:covo/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Skip extends GetView<OnboardingcontrollerImp> {
  const Skip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
          onPressed: (){
            controller.skip();
          },
           child: const Text("Skip", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , fontFamily: "Gupter"  , decoration: TextDecoration.underline,
           )),
         );
  }
}