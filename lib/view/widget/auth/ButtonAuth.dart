import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonAuth({Key? key, required this.text, this.onPressed}) : super(key: key);
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
            onPressed: 
              onPressed,
            
            child:  Text(text,
             style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20 , fontFamily: "Gupter" ))
           ),
    );
  }
}