import 'package:flutter/material.dart';

class TextFieldCov extends StatelessWidget {
  final String? hint;
  final String? label;
  final TextEditingController? controller;

  const TextFieldCov({Key? key, this.hint, this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, fontFamily: "Gupter"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        label: Text(label!),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
