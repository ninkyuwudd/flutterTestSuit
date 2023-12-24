import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomTextBox(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: hint),
    );
  }
}
