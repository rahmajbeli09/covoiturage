import 'package:covo/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Resetpasswordcontroller extends GetxController{
  toSuccessPage();

}
class ResetpasswordcontrollerImp extends Resetpasswordcontroller{
    late TextEditingController password ;
    late TextEditingController newPassword ; 

    @override
  void onInit() {
    password = TextEditingController();
    newPassword = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    newPassword.dispose();
    super.dispose();
  }
  
  @override
  toSuccessPage() {
    Get.offAllNamed(AppRoute.success);
  }
}