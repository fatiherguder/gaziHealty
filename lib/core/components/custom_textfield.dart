import 'package:flutter/material.dart';
import 'package:gazihealty/core/palette.dart';

class CustomTextfield extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool isPass;
  final TextEditingController conroller;
  const CustomTextfield(
    this.labelText,
    this.icon,
    this.isPass,
    this.conroller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: conroller,
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
    );
  }
}
