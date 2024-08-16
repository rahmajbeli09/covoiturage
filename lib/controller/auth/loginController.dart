import 'package:covo/core/constant/routes.dart';
import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:covo/core/services/repository/authentification_repo/exceptions/signup_email_password_failure.dart';
import 'package:covo/view/screen/auth/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  toSignUp();
  toForgetPassword();
  login();
  toHome();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void toSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  @override
  void toForgetPassword() {
    Get.toNamed(AppRoute.forget);
  }

  @override
  Future<void> login() async {
    try {
      // Appel à la fonction de connexion
      final userCredential = await AuthentificationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim()
      );

      // Vérification si la connexion a réussi
      if (userCredential != null) {
        // Connexion réussie, redirection vers l'écran d'accueil
        toHome();
      }
    } catch (e) {
      // Gestion des erreurs spécifiques
      if (e is SignUpWithEmailAndPasswordFailure) {
        Get.snackbar(
          'Erreur',
          e.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.white
        );
      } else {
        Get.snackbar(
          'Erreur',
          'Une erreur inattendue est survenue. Veuillez réessayer.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.white
        );
      }
    }
  }

  @override
  void toHome() {
    Get.to(const Homescreen());
  }
}
