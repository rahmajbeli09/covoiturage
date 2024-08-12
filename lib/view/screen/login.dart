import 'package:covo/controller/loginController.dart';
import 'package:covo/core/constant/imageasset.dart';
import 'package:covo/view/widget/auth/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/auth/ButtonAuth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Se connecter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Gupter",
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "ReCouCou !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Gupter",
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(80)),
                child: Image.asset(
                  Imageasset.logo,
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
               TextF(
                mycontroller: controller.email,
                hinttext: "Entrer Votre Email",
                labeltext: "Email",
                icon: Icons.email_outlined,
               
              ),
               TextF(
                mycontroller: controller.password,
                hinttext: "Entrer Votre Mot De Passe",
                labeltext: "Mot De Passe",
                icon: Icons.lock_clock_outlined,
                // mycontroller: ,
              ),
              const SizedBox(height: 20),
              const ButtonAuth(text: "Se Connecter"),
              const SizedBox(height: 15),
             Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(onPressed: (){
                    controller.toForgetPassword();
                  },
                  child: const Text(
                    "Mot De Passe Oublié",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Gupter",
                      decoration: TextDecoration.underline,
                    ),
                  ),)
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'avez pas de compte ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Gupter",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toSignUp();
                    },
                    child: const Text(
                      " S'inscrire",
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
