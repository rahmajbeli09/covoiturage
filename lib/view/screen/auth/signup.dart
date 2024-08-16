import 'dart:core';

import 'package:covo/controller/auth/signupController.dart';
import 'package:covo/data/model/usermodel.dart';
import 'package:covo/view/widget/auth/ButtonAuth.dart';
import 'package:covo/view/widget/auth/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("S'inscrire", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("ReCouCou !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, fontFamily: "Gupter")),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(children: [
               TextF(
                mycontroller: controller.nom,
                hinttext: "Entrer Votre Nom D'utilisateur",
                labeltext: "Nom d'utilisateur",
                icon: Icons.person_2_outlined,
                //mycontroller: ,
              ),
               TextF(
                mycontroller: controller.email,
                hinttext: "Entrer Votre Email",
                labeltext: "Email",
                icon: Icons.email_outlined,
                //mycontroller: ,
              ),
               TextF(
                mycontroller: controller.num,
                hinttext: "Entrer Votre numéro de telephone",
                labeltext: "Numéro",
                icon: Icons.phone_android_outlined,
                //mycontroller: ,
              ),
               TextF(
                mycontroller: controller.password,
                hinttext: "Entrer Votre Mot De Passe",
                labeltext: "Mot De Passe",
                icon: Icons.lock_clock_outlined,
                //mycontroller: ,
              ),
              const SizedBox(height: 20),
               ButtonAuth(text: "s'inscrire",
               onPressed: (){
                if(_formKey.currentState!.validate()){
                  controller.registerUser(controller.email.text.trim(), controller.password.text.trim());
                }
               // controller.toSucessSignUp();
               final user = UserModel(
                email: controller.email.text.trim(),
                 nom: controller.nom.text.trim(), 
                 password: controller.password.text.trim(),
                  num: controller.num.text.trim()
                  );
                  controller.createUser(user);
                  controller.toLogin();
                },),
              ],)),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Avez-vous déja un compte ?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Gupter")),
                  GestureDetector(
                    onTap: () {
                      controller.toLogin();
                    },
                    child: const Text(
                      " Se connecter",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Gupter",
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 211, 150, 19),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
