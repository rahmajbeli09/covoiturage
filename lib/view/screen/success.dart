import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
       const  SizedBox(height: 220,),
         const Text("Votre mot de passe est changé avec succées !",style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" )),
         const SizedBox(height: 40),
        Center(
        child: const Icon(
          Icons.check_circle_outline,
          size: 250,
          color:  Color.fromARGB(255, 211, 150, 19),
        ).animate(
          onPlay: (controller) => controller.repeat(reverse: true),
        ).scaleXY(
          duration: const Duration(seconds: 2),
          begin: 0.8,
          end: 1.2,
        ),
      ),
      ],) 
    );
  }
}