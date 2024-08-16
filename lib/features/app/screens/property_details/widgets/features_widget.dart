import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';

class FeaturesWidget extends StatelessWidget {
  const FeaturesWidget({super.key, this.popup = false});

  final bool popup;

  @override
  Widget build(BuildContext context) {
    List<String> icons = [
      TImage.city,
      TImage.workSpace,
      TImage.wifi,
      TImage.tv,
      TImage.parking,
      TImage.ac,
      TImage.washer,
      TImage.drying,
      TImage.kitchen,
    ];
    List<String> title = [
      TTexts.citySkylineViewLabel.tr,
      TTexts.dedicatedWorkspaceLabel.tr,
      TTexts.wifiLabel.tr,
      "55\" ${TTexts.tvLabel.tr}",
      TTexts.freeParkingLabel.tr,
      TTexts.airConditioningLabel.tr,
      TTexts.washerLabel.tr,
      TTexts.dryingLabel.tr,
      TTexts.kitchenLabel.tr,
    ];
    return Column(
      children: [
        TSectionHeading(
          title: TTexts.featuresLabel.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        TGridLayout(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.sm,
          crossAxisSpacing: TSizes.sm,
          mainAxisExtent: TSizes.md,
          itemCount: popup ? 5 : title.length,
          itemBuilder: (_, index) => Align(
            alignment: AlignmentDirectional.centerStart,
            child: FittedBox(
              child: HorizontalIconText(
                isSub: false,
                spaceBetween: TSizes.sm,
                icon: icons[index],
                title: title[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
