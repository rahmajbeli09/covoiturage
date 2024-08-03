import 'package:covo/view/widget/auth/textField.dart';
import 'package:flutter/material.dart';

import '../widget/auth/ButtonAuth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Se connecter', style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" )),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:const  Column(children: [
           Text("ReCouCou !", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 40 , fontFamily: "Gupter" )),
           SizedBox(height: 20,),
          TextF(
            hinttext: "Entrer Votre Email",
            labeltext: "Email",
            icon: Icons.email_outlined,
            //mycontroller: ,
          ),
          TextF(
            hinttext: "Entrer Votre Mot De Passe",
            labeltext: "Mot De Passe",
            icon: Icons.lock_clock_outlined,
            //mycontroller: ,
          ),
          ButtonAuth(),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Mot De Passe Oublié", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , fontFamily: "Gupter"  , decoration: TextDecoration.underline, 
               )
               ),
            ],
          ),
          SizedBox(height: 80,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Vous n'avez pas de compte ?", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , fontFamily: "Gupter"
               )
               ),
               Text(" S'inscrire", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 16 , fontFamily: "Gupter"  , decoration: TextDecoration.underline, 
           )
           )

             ],
           ),

        ],),
      ),
      
    
    );
  }
}