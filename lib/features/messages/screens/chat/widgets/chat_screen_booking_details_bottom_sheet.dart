import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import '../../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../../data/services/exporter.dart';

class ChatScreenBookingDetailsBottomSheet extends StatelessWidget {
  const ChatScreenBookingDetailsBottomSheet(
      {super.key, required this.properties});

  final List<String> properties;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(TSizes.sm),
      height: TDeviceUtils.getScreenHeight() * 0.8,
      child: SingleChildScrollView(
          child: ListLayout(
              itemCount: properties.length,
              scrollDirection: Axis.vertical,
              separatorHeight: TSizes.sm,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                return PropertyWidget(
                  margin: EdgeInsets.zero,
                  propertyImage: properties[index],
                  isFav: false.obs,
                  com: false.obs,
                  index: index,
                  isSlidable: true,
                  heroTag: "ChatScreenBookingDetailsBottomSheetHeroTag$index",
                );
              })),
    );
  }
}
