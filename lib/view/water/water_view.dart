import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:gazihealty/view/water/water_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterScreen extends StatefulWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  State<WaterScreen> createState() => _WaterScreenState();
}

class _WaterScreenState extends State<WaterScreen> {
  late ConfettiController confettiController;

  @override
  void initState() {
    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(WaterViewModel());
    return SafeArea(
        child: Obx(
      () => Column(
        children: [
          buildCircularIndicator(_controller),
          buildConfetti(),
          _controller.waterNumber < 11
              ? buildGrid(_controller)
              : buildGrid10(_controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              decrementwater(_controller),
              incrementWaterBtn(_controller),
            ],
          )
        ],
      ),
    ));
  }

  Align buildConfetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: confettiController,
        shouldLoop: false,
        blastDirection: pi / 2,
        gravity: 0.02,
        numberOfParticles: 100,
        emissionFrequency: 0.02,
        displayTarget: false,
        blastDirectionality: BlastDirectionality.explosive,
        colors: const [
          Colors.redAccent,
          Colors.purpleAccent,
          Colors.pinkAccent,
          Colors.orange,
          Colors.orangeAccent
        ],
      ),
    );
  }

  Container incrementWaterBtn(WaterViewModel _controller) {
    return Container(
      width: 100,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Palette.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        onPressed: () {
          _controller.incrementWater();
          if (_controller.waterAmount == 2000) {
            setState(() {
              confettiController.play();
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("+",
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff264653))),
            Text("200mL",
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff264653))),
          ],
        ),
      ),
    );
  }

  Container decrementwater(WaterViewModel _controller) {
    return Container(
      width: 100,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Palette.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        onPressed: () => _controller.decrementwater(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("-",
                style: GoogleFonts.montserrat(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff264653))),
            Text("200mL",
                style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff264653))),
          ],
        ),
      ),
    );
  }

  SizedBox buildGrid(WaterViewModel _controller) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index < _controller.waterNumber.toInt()) {
                return buildGlass();
              } else {
                return buildGlassEmpty();
              }
            }),
      ),
    );
  }

  SizedBox buildGrid10(WaterViewModel _controller) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 9) {
                return buildGlass10(_controller);
              } else {
                return buildGlass();
              }
            }),
      ),
    );
  }

  Padding buildGlass() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 15,
        height: 15,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/core/assets/water-glass.png"),
        )),
      ),
    );
  }

  Padding buildGlass10(WaterViewModel _controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/core/assets/water-glass-blur.png"),
        )),
        child: Text(
          "+" + _controller.gridNumber.toString(),
          style: GoogleFonts.montserrat(
              fontSize: 24, fontWeight: FontWeight.w600, color: Palette.dark),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Padding buildGlassEmpty() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 15,
        height: 15,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/core/assets/water-glass-empty.png"),
        )),
      ),
    );
  }

  Padding buildCircularIndicator(WaterViewModel _controller) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Obx((() => CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 10.0,
              percent: _controller.waterAmount > 2000
                  ? 1
                  : _controller.waterAmount / 2000,
              animation: true,
              animationDuration: 1000,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CupertinoIcons.drop,
                    size: 32,
                  ),
                  Text(
                    _controller.waterAmount.toString(),
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "HEDEF 2 LİTRE",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ),
                ],
              ),
              progressColor: Palette.blue,
              backgroundColor: Palette.dark,
              circularStrokeCap: CircularStrokeCap.round,
            ))));
  }
}
