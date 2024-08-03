import 'package:covo/core/constant/routes.dart';
import 'package:covo/view/screen/login.dart';
import 'package:flutter/material.dart';

Map<String , Widget Function(BuildContext)> routes = {
 AppRoute.login : (context) => const Login()
};