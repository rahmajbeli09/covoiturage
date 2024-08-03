import 'package:covo/controller/onBoardingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class onBoardingSlider extends GetView<OnboardingcontrollerImp> {
  const onBoardingSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
              itemCount: onBoardingList.length,
              itemBuilder: (context ,i) => Column(children: [
              const SizedBox(height: 10),
              Text(onBoardingList[i].title!, style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 30 , fontFamily: "Gupter")),
              Image.asset(onBoardingList[i].image! ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(onBoardingList[i].body! , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" , color: Color.fromARGB(255, 121, 114, 114)) , textAlign: TextAlign.center,)
                )
              ]
            ));
  }
}