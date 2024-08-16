import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/drawers/drawer_controller.dart';

class PriceRangeSlider extends StatelessWidget {
  const PriceRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyDrawerController());

    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Start: ${controller.priceRangeStart.value.toStringAsFixed(2)}\nEnd: ${controller.priceRangeEnd.value.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
