import 'package:flutter/material.dart';

class TextF extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData icon;
  final TextEditingController mycontroller;
  const TextF({Key? key, required this.hinttext, required this.labeltext, required this.icon, required this.mycontroller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 23 , top: 10),
      child: TextFormField(
        controller: mycontroller,
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(fontWeight: FontWeight.bold , fontSize:13 , fontFamily: "Gupter" ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding: const EdgeInsets.symmetric(vertical: 5 , horizontal:15),
                label:  Text(labeltext),
                suffixIcon:   Icon(icon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
    );
  }
}