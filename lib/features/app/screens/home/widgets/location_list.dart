import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/text_strings.dart';

import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class LocationList extends StatelessWidget {
  const LocationList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
    ];
    List<String> images = [
      TImage.businessBay,
      TImage.downTown,
      TImage.dubaiHills,
      TImage.dubaiMarina,
      TImage.laCote,
    ];
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: label.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(
              onTap: () =>
                  Get.to(() => const SeeAllPropertiesOrAfterSearchScreen()),
              image: images[index],
              title: label[index],
            );
          }),
    );
  }
}
