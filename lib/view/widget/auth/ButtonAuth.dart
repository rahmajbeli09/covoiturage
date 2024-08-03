import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  const ButtonAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
                           color:  Color.fromARGB(255, 211, 150, 19),
            ),
            child: MaterialButton(
            onPressed: (){
            },
            child:const  Text("Se Connecter", style:  TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" ))
           ),
    );
  }
}