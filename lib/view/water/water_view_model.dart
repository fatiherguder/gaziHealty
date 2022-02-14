import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WaterViewModel extends GetxController {
  var waterNumber = 0.obs;
  var waterAmount = 0.obs;
  var gridNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print(waterNumber);
  }

  incrementWater() {
    waterNumber = waterNumber + 1;
    waterAmount = waterAmount + 200;
    incrementGridNumber();
  }

  decrementwater() {
    if (waterNumber != 0) {
      waterNumber = waterNumber - 1;
      waterAmount = waterAmount - 200;
      decrementGridNumber();
    } else {
      waterNumber = 0 as RxInt;
    }
  }

  incrementGridNumber() {
    waterNumber > 10 ? gridNumber = gridNumber + 1 : null;
  }

  decrementGridNumber() {
    waterNumber > 10 ? gridNumber = gridNumber - 1 : null;
  }
}
