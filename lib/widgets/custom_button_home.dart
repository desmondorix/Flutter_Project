import 'package:flutter/material.dart';

class CustomButtonHome extends StatelessWidget {
  final String buttonTextHome;
  final Function() onTap;
  const CustomButtonHome({
    super.key, required this.buttonTextHome, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
          backgroundColor: Colors.grey[400],
          foregroundColor: Colors.black,
          minimumSize: const Size(250, 50),
          shadowColor: Colors.black
          ),
      onPressed: onTap,
      child: Text(buttonTextHome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}