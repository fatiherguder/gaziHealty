import 'package:flutter/material.dart';
import 'package:gazihealty/core/palette.dart';

class SmallCustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isPass;
  const SmallCustomTextfield(
    this.labelText,
    this.icon,
    this.isPass,
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double Screenwidth = MediaQuery.of(context).size.width;
    double Screenheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Screenwidth * 0.29,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          obscureText: isPass,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Palette.light),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Palette.dark),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: labelText,
            hintStyle: TextStyle(color: Palette.light),
            prefixIcon: Icon(icon, color: Palette.light),
            filled: true,
          ),
        ),
      ),
    );
  }
}
