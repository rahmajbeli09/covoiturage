import 'package:covo/controller/auth/verifycodecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Verifier le code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gupter")),
      ),
      body :  SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
           const  Text("Entrer le code reçu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, fontFamily: "Gupter")),
            const SizedBox(height: 40),
            OtpTextField(
              fieldHeight: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color.fromARGB(255, 211, 150, 19),
              showFieldAsBox: true,
              onCodeChanged: (String code){},
              onSubmit: (String verificationCode ){
                controller.toResetPassword();
              },
            ),
          ],
        ),

    )));
  }
}