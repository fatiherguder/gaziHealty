import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../palette.dart';

class StepDay extends StatelessWidget {
  final String day;
  final int step;
  const StepDay({Key? key, required this.day, required this.step})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 4.0,
            percent: step > 10000 ? 1 : step / 10000,
            animation: true,
            animationDuration: 1000,
            center: Text(
              step.toString(),
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 16),
            ),
            progressColor: Palette.light,
            backgroundColor: Palette.dark,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        )
      ],
    );
  }
}
