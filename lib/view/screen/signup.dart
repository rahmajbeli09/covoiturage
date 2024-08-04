import 'package:covo/controller/signupController.dart';
import 'package:covo/view/widget/auth/ButtonAuth.dart';
import 'package:covo/view/widget/auth/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
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
               TextF(
                mycontroller: controller.username,
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
                mycontroller: controller.phone,
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
              const ButtonAuth(text: "s'inscrire",),
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
