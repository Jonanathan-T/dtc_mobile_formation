import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final BoxDecoration? decoration;

  const Button({super.key, this.text = "", required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: decoration,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
