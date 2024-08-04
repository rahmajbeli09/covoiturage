import 'package:covo/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{
  toSignUp();
  toForgetPassword();
}

class LoginControllerImp extends LoginController{

  late TextEditingController email ;
  late TextEditingController password;
  @override
  toSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }
  @override
  void onInit() {
    email= TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  toForgetPassword() {
    Get.toNamed(AppRoute.forget);
  }

}