import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:gazihealty/view/water/water_view_model.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WaterScreen extends StatelessWidget {
  const WaterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(WaterViewModel());
    return SafeArea(
      child: Column(
        children: [
          buildCircularIndicator(_controller),
          buildGrid(_controller),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              decrementwater(_controller),
              incrementWaterBtn(_controller),
            ],
          )
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
        onPressed: () => _controller.incrementWater(),
        child: const Text("+",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff264653))),
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
        child: const Text("-",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff264653))),
      ),
    );
  }

  SizedBox buildGrid(WaterViewModel _controller) {
    return SizedBox(
        height: 200,
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                ),
                itemCount: _controller.waterNumber.value,
                itemBuilder: (BuildContext context, int index) {
                  return buildGlass();
                }),
          ),
        ));
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 40),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "HEDEF 2 LİTRE",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
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
