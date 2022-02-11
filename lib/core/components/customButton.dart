import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final Function() onClick;
  const CustomButton({Key? key, this.color, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                )
            )
        ),
        onPressed: onClick,
        child: Text(text),
      ),
    );
  }
}
