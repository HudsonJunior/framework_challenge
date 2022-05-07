import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.purple,
  }) : super(key: key);

  final String title;
  final Color backgroundColor;

  show(BuildContext context) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: build(context),
          backgroundColor: backgroundColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
