import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:covo/view/screen/Home/add.dart';
import 'package:covo/view/screen/Home/chat.dart';
import 'package:covo/view/screen/auth/login.dart';
import 'package:covo/view/screen/auth/notification.dart';
import 'package:covo/view/screen/Home/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/Home/Home.dart';

abstract class HomeScreenController extends GetxController{

    changePage(int currentPage);
}
class HomeScreenControllerImp extends HomeScreenController{
  int currentPage = 0;
  List<Widget> listPage =[
    const Home(),
    const Notifications(),
    const Chat(),
    const Profile(),
    const Add(),
    
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  void logout() async {
    await AuthentificationRepository.instance.logout();
    Get.offAll(() => const Login()); // Redirect to login screen after logout
  }

}