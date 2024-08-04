import 'package:covo/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPassController extends GetxController{
  toVerifyCode();
  checkEmail();
}
class ForgetPassControllerImp extends ForgetPassController{
  late TextEditingController  email ;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
  @override
  toVerifyCode() {
    Get.toNamed(AppRoute.verifyCode);
  }
  
  @override
  checkEmail() {
  
  }
}