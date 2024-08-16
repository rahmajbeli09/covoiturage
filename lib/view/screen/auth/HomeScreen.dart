import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homeScreenController.dart';
import '../../../core/constant/imageasset.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller)=>Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 211, 150, 19),
        onPressed: (){
          controller.changePage(4);
        },
        child:const Icon(Icons.add),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(children: [
        Row(
          children: [
          MaterialButton(onPressed: (){
            controller.changePage(0);
          },
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Image.asset(Imageasset.home , height:30,),
              const  Text("Acceuil"),
            ],
          ),),
          MaterialButton(onPressed: (){
            controller.changePage(3);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Imageasset.profil , height:30,),
              const Text("Profile"),
            ],
          ),),
 
        ],),
      const  Spacer(),
         Row(children: [
          MaterialButton(onPressed: (){
            controller.changePage(1);
          },
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Image.asset(Imageasset.noti , height:25,),
             const Text("notifications"),
            ],
          ),),
          MaterialButton(onPressed: (){
            controller.logout();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Image.asset(Imageasset.logout , height:30,),
              const Text("Logout"),
            ],
          ),),
 
        ],),
      ],),),
      body: controller.listPage.elementAt(controller.currentPage),
    ));
  }
}