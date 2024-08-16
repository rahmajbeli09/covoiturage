import 'package:covo/view/screen/auth/motdepasseoubli%C3%A9.dart';
import 'package:covo/core/constant/routes.dart';
import 'package:covo/view/screen/auth/login.dart';
import 'package:covo/view/screen/auth/resetPassword.dart';
import 'package:covo/view/screen/auth/signup.dart';
import 'package:covo/view/screen/auth/success.dart';
import 'package:covo/view/screen/auth/verifycode.dart';
import 'package:flutter/material.dart';

import 'view/screen/auth/successSignUp.dart';

Map<String , Widget Function(BuildContext)> routes = {
 AppRoute.login : (context) => const Login(),
 AppRoute.signup : (context) => const SignUp(),
 AppRoute.forget : (context) => const MotDePasseOublie(),
 AppRoute.verifyCode : (context) => const VerifyCode(),
 AppRoute.reset : (context) => const ResetPassword(),
 AppRoute.success : (context) => const SuccessPage(),
 AppRoute.successSignUp : (context) => const Successsignup(),
};