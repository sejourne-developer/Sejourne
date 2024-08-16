import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';
import '../../../controllers/product_details/product_details_controller.dart';
import '../../map/map_screen.dart';

class PropertyDetailsMiniMap extends StatelessWidget {
  const PropertyDetailsMiniMap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TSectionHeading(
          title: TTexts.whereYouBe.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        TRoundedContainer(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadiusDirectional.all(
                Radius.circular(TSizes.md)),
            child: GoogleMap(
              style: THelperFunctions.isDarkMode(context)
                  ? ProductDetailsController.instance.darkMapStyle
                  : null,
              liteModeEnabled: true,
              // the required field
              mapToolbarEnabled: false,
              // to disable buttons
              markers: {
                const Marker(
                    markerId: MarkerId("Property Location"),
                    position: LatLng(25.276987, 55.296249),
                    icon: BitmapDescriptor.defaultMarker)
              },
              onTap: (latLng) => Get.to(
                    () => const MapScreen(
                  propertyLatitude: 25.276987,
                  propertyLongitude: 55.296249,
                  initialLatitude: 25.276987,
                  initialLongitude: 55.296249,
                ),
              ),
              initialCameraPosition: const CameraPosition(
                  target: LatLng(25.276987, 55.296249), zoom: 10),
            ),
          ),
        ),
      ],
    );
  }
}
