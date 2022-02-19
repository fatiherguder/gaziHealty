import 'package:flutter/material.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class FoodMenuCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final String img;
  const FoodMenuCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.desc,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TouchableOpacity(
        activeOpacity: 0.8,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [buildTitle(), buildDesc()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDesc() {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        desc,
        style: GoogleFonts.montserrat(
            fontSize: 16, fontWeight: FontWeight.w300, color: Colors.white),
      ),
    );
  }

  Row buildTitle() {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        )
      ],
    );
  }
}
