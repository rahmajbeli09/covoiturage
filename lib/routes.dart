import 'package:covo/view/screen/motdepasseoubli%C3%A9.dart';
import 'package:covo/core/constant/routes.dart';
import 'package:covo/view/screen/login.dart';
import 'package:covo/view/screen/resetPassword.dart';
import 'package:covo/view/screen/signup.dart';
import 'package:covo/view/screen/success.dart';
import 'package:covo/view/screen/verifycode.dart';
import 'package:flutter/material.dart';

import 'view/screen/successSignUp.dart';

Map<String , Widget Function(BuildContext)> routes = {
 AppRoute.login : (context) => const Login(),
 AppRoute.signup : (context) => const SignUp(),
 AppRoute.forget : (context) => const MotDePasseOublie(),
 AppRoute.verifyCode : (context) => const VerifyCode(),
 AppRoute.reset : (context) => const ResetPassword(),
 AppRoute.success : (context) => const SuccessPage(),
 AppRoute.successSignUp : (context) => const Successsignup(),
};