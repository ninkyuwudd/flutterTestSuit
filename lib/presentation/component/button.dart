import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  const CustomButton({super.key, required this.function, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            function();
          },
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
