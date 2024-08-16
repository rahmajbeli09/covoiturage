import 'package:covo/core/constant/routes.dart';
import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:covo/core/services/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/usermodel.dart';

abstract class SignUpController extends GetxController{
  toLogin();
  toSucessSignUp();
}

class SignUpControllerImp extends SignUpController{
  late TextEditingController email ; 
  late TextEditingController password ;
  late TextEditingController  num;
  late TextEditingController  nom ; 
  final userRepo = Get.put(UserRepository());
  
  @override
  toLogin() {
    Get.offAllNamed(AppRoute.login);
  }
  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    num = TextEditingController();
    nom = TextEditingController();
    super.onInit();
  }
   @override
  void dispose() {
    email.dispose();
    num.dispose();
    nom.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  toSucessSignUp() {
    Get.offAllNamed(AppRoute.successSignUp);
  }
  
  
  void registerUser(String email , String password) {
    AuthentificationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

 Future <void> createUser(UserModel user) async{
   await userRepo.createUser(user);
  }

}