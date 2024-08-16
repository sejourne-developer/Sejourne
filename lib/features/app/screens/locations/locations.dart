import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
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
      TImage.businessBay,
      TImage.downTown,
      TImage.dubaiHills,
      TImage.dubaiMarina,
      TImage.laCote,
    ];
    return Scaffold(
      body: BackgroundImageContainer(
        child: Column(
          children: [
            const NetworkCheckerContainer(),

            TAppBar(
              title: Text(TTexts.locationsLabel.tr),
              leadingIcon:Get.locale==arabic? TImage.rightArrowIcon:TImage.backArrow,
            ),
            TGridLayout(
                mainAxisExtent: 150,
                itemCount: images.length,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                itemBuilder: (_, index) => TVerticalImageText(
                      onTap: () => Get.to(
                          () => const SeeAllPropertiesOrAfterSearchScreen()),
                      imageSize: 120,
                      image: images[index],
                      title: label[index],
                    )),
          ],
        ),
      ),
    );
  }
}
