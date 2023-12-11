import 'package:flutter/material.dart';

class CustomTextFieldHome extends StatelessWidget {
  final TextEditingController controller;
  final String label;

    const CustomTextFieldHome({
      super.key, required this.label, required this.controller
    });
  
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 250,
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 3,
                  offset: Offset(3, 3))
            ]),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: label,
              filled: true,
              fillColor: Colors.grey[300],
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(22))
              )),
        ),
      );
    }
  }