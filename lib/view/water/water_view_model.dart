import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WaterViewModel extends GetxController {
  var waterNumber = 0.obs;
  var waterAmount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print(waterNumber);
  }

  incrementWater() {
    waterNumber = waterNumber + 1;
    waterAmount = waterAmount + 200;
  }

  decrementwater() {
    waterNumber = waterNumber - 1;
    waterAmount = waterAmount - 200;
  }
}
