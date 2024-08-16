import '../../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';
import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';
import '../property_details_screen.dart';

class PropertyRecommendationWidget extends StatelessWidget {
  const PropertyRecommendationWidget({super.key, required this.banners});
final List<String> banners;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: TTexts.recommendations.tr,
          onPressed: () => Get.to(
                  () => const SeeAllPropertiesOrAfterSearchScreen()),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        ListLayout(
            padding: EdgeInsets.zero,
            separatorHeight: TSizes.sm,
            itemBuilder: (_, index) => PropertyWidget(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            PropertyDetailScreen(
                              heroTag:
                              "PropertyDetailScreenHeroTag2$index",
                            )));
                // Get.put(() => const PropertyDetailScreen());
              },
              isSlidable: false,
              margin: EdgeInsets.zero,
              propertyImage: banners[index],
              isFav: false.obs,
              com: false.obs,
              index: index,
              heroTag: "PropertyDetailScreenHeroTag2$index",
            ),
            itemCount: banners.length),
      ],
    );
  }
}
