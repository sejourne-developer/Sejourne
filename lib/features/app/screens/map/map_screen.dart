import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/data/services/app_variables.dart';
import 'package:sejourne/features/app/controllers/product_details/product_details_controller.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({
    super.key,
    required this.propertyLatitude,
    required this.propertyLongitude,
    required this.initialLatitude,
    required this.initialLongitude,
  });

  final double propertyLatitude,
      propertyLongitude,
      initialLatitude,
      initialLongitude;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: TAppBar(
        leadingIcon: Get.locale==arabic?TImage.rightArrowIcon:TImage.backArrow,
        title: Text("${TTexts.propertyLabel.tr} ${TTexts.locationLabel.tr}"),
      ),
      body:  GoogleMap(
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          //myLocationButtonEnabled: true,
          style: THelperFunctions.isDarkMode(context) ? ProductDetailsController.instance.darkMapStyle : null,
          initialCameraPosition: CameraPosition(target: LatLng(
            initialLatitude,initialLongitude
          ), zoom: 12),
          // myLocationEnabled: true,
          markers: {
             Marker(
                markerId: const MarkerId("Property Location"),
                position: LatLng(propertyLatitude, propertyLongitude),
                icon: BitmapDescriptor.defaultMarker)
          },
        ),

    );
  }
}
