import 'package:covo/core/services/repository/authentification_repo/auth_repo.dart';
import 'package:covo/firebase_options.dart';
import 'package:covo/routes.dart';
import 'package:covo/view/screen/onBoarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthentificationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:const  OnBoarding(),
      routes: routes,
    );
  }
}


