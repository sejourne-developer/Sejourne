import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import 'package:sejourne/utils/constants/image_strings.dart';
import 'package:sejourne/utils/constants/sizes.dart';

import '../../../../../common/widgets/custom_shapes/containers/property_container.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark=THelperFunctions.isDarkMode(context);
    List<String> properties = [
      TImage.prop1,
      TImage.prop2,
      TImage.prop3,
      TImage.prop4,
      TImage.prop5,
      TImage.prop6,
      TImage.prop7,
      TImage.prop8,
      TImage.prop9,
      TImage.prop10,
      TImage.prop11,
      TImage.prop12,
      TImage.prop13,
      TImage.prop14,
      TImage.prop15,
      TImage.prop16,
      TImage.property,
      TImage.property1,
      TImage.property2,
      TImage.property3,
      TImage.property4,
      TImage.property5,
      TImage.property6,
    ];

    return SizedBox(
      width: double.infinity,
      //height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: properties.length,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsetsDirectional.only(end: TSizes.sm),
        itemBuilder: (_, index) {
          return PropertyWidget(
            onPressed: () => Get.to(() =>  PropertyDetailScreen(
               heroTag: "HomeHeroTag$index",
            )),
            propertyImage: properties[index],
            isFav: false.obs,
            com: false.obs,
            index: index,
            heroTag: "HomeHeroTag$index",
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
      ),
    );
  }
}
