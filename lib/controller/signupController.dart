import 'package:covo/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{
  toLogin();
  toSucessSignUp();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController email ; 
  late TextEditingController password ;
  late TextEditingController  phone;
  late TextEditingController  username ; 
  
  @override
  toLogin() {
    Get.offAllNamed(AppRoute.login);
  }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }
   @override
  void dispose() {
    email.dispose();
    phone.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  toSucessSignUp() {
    Get.offAllNamed(AppRoute.successSignUp);
  }

}