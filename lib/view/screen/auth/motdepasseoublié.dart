import 'package:covo/controller/auth/forgetpassController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/ButtonAuth.dart';
import '../../widget/auth/textField.dart';

class MotDePasseOublie extends StatelessWidget {
  const MotDePasseOublie({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ForgetPassControllerImp controller = Get.put(ForgetPassControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Mot de passe oublié", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("Tu as oublié ton mot de passe !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: "Gupter")),
              const SizedBox(height: 40),
            
               TextF(
                mycontroller: controller.email,
                hinttext: "Entrer Votre Email",
                labeltext: "Email",
                icon: Icons.email_outlined,
                
              ),
              const SizedBox(height: 20),
               ButtonAuth(text: "Suivant", onPressed: (){controller.toVerifyCode();}),
            ],
          ),
        ),
      ));
  }
}