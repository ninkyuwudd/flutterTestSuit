import 'package:flutter/material.dart';

class CustomTextBoxNoController extends StatelessWidget {
  final String hint;
  const CustomTextBoxNoController({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          hintText: hint),
    );
  }
}
