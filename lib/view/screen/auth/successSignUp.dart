import 'package:covo/controller/auth/signupController.dart';
import 'package:covo/view/widget/auth/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/ButtonAuth.dart';

class Successsignup extends StatelessWidget {
  const Successsignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "Votre compte est crée avec succes!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Gupter",
                ),
              ),
              const SizedBox(height: 20),
               TextF(
                mycontroller: controller.password,
                hinttext: "Entrer Votre Email",
                labeltext: "Email",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 20),
               ButtonAuth(text: "Suivant",onPressed: (){controller.toLogin();},),
              const SizedBox(height: 15),
          
            ],
          ),
        ),
      ),
    );
  }
}