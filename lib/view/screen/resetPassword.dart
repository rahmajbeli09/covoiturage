import 'package:covo/controller/resetpasswordController.dart';
import 'package:covo/view/widget/auth/ButtonAuth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/auth/textField.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ResetpasswordcontrollerImp controller = Get.put(ResetpasswordcontrollerImp());
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
        title: const Text("Nouveau Mot de passe ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text("Saisir ton nouveau mot de passe !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: "Gupter")),
              const SizedBox(height: 40),
               TextF(
                mycontroller: controller.password,
                hinttext: "Entrer le nouveau mot de passe",
                labeltext: "Mot de passe",
                icon: Icons.lock_clock_outlined,
                
              ),
              TextF(
                mycontroller: controller.newPassword,
                hinttext: "Entrer le nouveau mot de passe",
                labeltext: "Mot de passe",
                icon: Icons.lock_clock_outlined,
                
              ),
              const SizedBox(height: 20),
               ButtonAuth(text: "Suivant", onPressed: (){controller.toSuccessPage();}),
            ],
          ),
        ),
      ),
    );
  }
}