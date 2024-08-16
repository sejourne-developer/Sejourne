import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/personalization/screens/reviews/widgets/reviews_history_container.dart';
import 'package:sejourne/navigation_menu.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// App bar
                 TAppBar(
                  leadingOnPressed: (){
                    if(Get.previousRoute.toString() == "/"){
                      Get.to(()=>const NavigationMenu());
                    }else{
                      Get.back();
                    }
                  },
                  leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                  title:  Text(TTexts.reviewsLabel.tr),
                ),
                const SizedBox(
                  height: TSizes.sm,
                ),

                ListLayout(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => const ReviewsHistoryContainer(
                    userName: "Catalin Pustai",
                    reviewComment:
                        "Lovely room. Great host. Easy to find, plenty of privacy. Clearly put thought in the decoration. Solid communication too. Would definitely recommend...",
                    location: "4.5",
                    cleanliness: "4.5",
                    accuracy: "4.5",
                    checkIn: "4.5",
                    communication: "4.5",
                    value: "4.5",
                    apartmentLocation: "Studio (806) at Dubai Arch (JLT)",
                    rating: 4.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
