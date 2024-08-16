import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/controllers/map/place.dart';

import '../../../../common/widgets/custom_shapes/containers/property_container.dart';
import '../../../../common/widgets/icons/circular_icon.dart';

class MapSample extends StatefulWidget {
  const MapSample({
    super.key,
  });

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  static var zoom = 10.0;
  late GoogleMapController? _controller;
  var mapType = MapType.normal;
  late Marker locationMarker = const Marker(markerId: MarkerId("My Location"));
  late dynamic _darkMapStyle = TImage.darkMapStyle;
  bool _isLoading = false;
  late String lat = "";
  late String long = "";

  //GoogleMapController googleMapController=GoogleMapController();

  final List<String> properties = [
    TImage.property,
    TImage.property1,
    TImage.property2,
    TImage.property3,
    TImage.property4,
    TImage.property5,
  ];

  late ClusterManager _manager;

  //Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  final CameraPosition _parisCameraPosition =
      CameraPosition(target: const LatLng(25.276987, 55.296249), zoom: zoom);

  List<Place> items = [
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Restaurant $i',
          isClosed: i % 2 == 0,
          latLng: LatLng(25.276987 - i * 0.001, 55.296249 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Bar $i',
          latLng: LatLng(25.276987 + i * 0.01, 55.296249 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Hotel $i',
          latLng: LatLng(25.276987 - i * 0.1, 55.296249 - i * 0.01)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Place $i',
          latLng: LatLng(25.276987 + i * 0.001, 55.296249 + i * 0.001)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test $i',
          latLng: LatLng(25.276987 + i * 0.1, 55.296249 + i * 0.1)),
    for (int i = 0; i < 10; i++)
      Place(
          name: 'Test2 $i',
          latLng: LatLng(25.276987 + i * 1, 55.296249 + i * 1)),
  ];

  @override
  void initState() {
    _manager = _initClusterManager();
    _loadMapStyles();
    super.initState();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(
      items,
      _updateMarkers,
      markerBuilder: _markerBuilder,
    );
  }

  void _updateMarkers(Set<Marker> markers) {
    if (kDebugMode) {
      print('Updated ${markers.length} markers');
    }
    setState(() {
      this.markers = markers;
    });
  }

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString(TImage.darkMapStyle);
  }

  Future<Position> _determinePosition() async {
    _isLoading = true;
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _isLoading = false;
      THelperFunctions.showGeneralAlert(TTexts.locationServiceTitle.tr,
          TTexts.locationServiceSubTitle.tr, "Sejourne App");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _isLoading = false;

        THelperFunctions.showGeneralAlert(TTexts.locationServiceDeniedTitle.tr,
            TTexts.locationServicesDeniedRequiresSubTitle.tr, "Sejourne App");

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      THelperFunctions.showGeneralAlert(
          TTexts.locationServiceDeniedPermanentlyTitle.tr,
          TTexts.locationServiceDeniedPermanentlySubTitle.tr,
          "Sejourne App");
      _isLoading = false;

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _isLoading = false;

    return await Geolocator.getCurrentPosition();
  }

  List<Rx<bool>> fav = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
              alignment: Alignment.topCenter, child: NetworkCheckerContainer()),
          GoogleMap(
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              mapType: mapType,

              //myLocationButtonEnabled: true,
              style:
                  THelperFunctions.isDarkMode(context) ? _darkMapStyle : null,
              initialCameraPosition: _parisCameraPosition,

              // myLocationEnabled: true,
              markers: markers..add(locationMarker),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
                _manager.setMapId(controller.mapId);
              },
              onCameraMove: _manager.onCameraMove,
              onCameraIdle: _manager.updateMap),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: TSizes.sm,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 140,
                width: double.infinity,
                child: CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 0,
                      //autoPlay: true,
                      viewportFraction: 0.8,
                      height: 180,
                      //pageSnapping: true,
                      //enlargeCenterPage: true,
                      scrollPhysics: const AlwaysScrollableScrollPhysics(),
                      //enableInfiniteScroll: true,
                      onPageChanged: (index, _) {
                        if (kDebugMode) {
                          print(items[index].latLng.latitude);
                        }
                        CameraPosition camera = CameraPosition(
                            target: LatLng(items[index].latLng.latitude,
                                items[index].latLng.longitude),
                            zoom: 17);

                        _controller?.animateCamera(
                          CameraUpdate.newCameraPosition(camera),
                        );
                      },
                      //controller.updatePageIndicator(index),
                      padEnds: false,
                    ),
                    items: properties
                        .map(
                          (url) => PropertyWidget(
                            propertyImage: url,
                            index: 0,
                            isFav: false.obs,
                            com: false.obs,
                            heroTag: "MapHeroTag$url",
                          ),
                        )
                        .toList()),
                // child: ListView.separated(
                //     separatorBuilder: (_, index) => const SizedBox(),
                //     itemCount: properties.length,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (_, index) => SizedBox(
                //         width: TDeviceUtils.getScreenWidth(context) * 0.90,
                //         child: PropertyWidget(
                //           isFav: fav[index],
                //             propertyImage: properties[index], index: index))),
              ),
            ),
          ),
          PositionedDirectional(
            top: TSizes.appBarHeight,
            end: TSizes.sm,
            child: SizedBox(
              width: 56,
              child: Column(
                children: [
                  TCircularIcon(
                    icon: TImage.clearIcon,
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  TCircularIcon(
                    icon: TImage.myLocationIcon,
                    isAnimated: _isLoading,
                    animatedIcon: TImage.loadingAnimation,
                    height: TSizes.iconLg,
                    width: TSizes.iconLg,
                    padding: TSizes.sm,

                    // color: TColors.dark,
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await _determinePosition().then((onValue) async {
                        lat = '${onValue.latitude}';
                        long = '${onValue.longitude}';
                        CameraPosition camera = CameraPosition(
                            target:
                                LatLng(double.parse(lat), double.parse(long)),
                            zoom: zoom);
                        locationMarker = Marker(
                          markerId: const MarkerId("My Location"),
                          position:
                              LatLng(double.parse(lat), double.parse(long)),
                        );

                        _controller?.animateCamera(
                          CameraUpdate.newCameraPosition(camera),
                        );
                        markers.add(locationMarker);

                        _updateMarkers(markers);

                        // setState(() {
                        //   _manager.updateMarkers(markers);
                        // });
                        //
                        setState(() {
                          _manager.updateMap;
                          _isLoading = false;
                        });
                        debugPrint("$lat,$long");
                      });
                    },
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  TCircularIcon(
                    icon: TImage.mapMapIcon,
                    removeColor: true,
                    onPressed: () {
                      setState(() {
                        if (mapType == MapType.normal) {
                          mapType = MapType.satellite;
                        } else {
                          mapType = MapType.normal;
                        }
                      });
                    },
                    //color: ,
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  TCircularIcon(
                    icon: TImage.zoomInIcon,
                    onPressed: () async {
                      _controller?.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  TCircularIcon(
                    onPressed: () async {
                      _controller?.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    icon: TImage.zoomOutIcon,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _manager.setItems(<Place>[
      //       for (int i = 0; i < 30; i++)
      //         Place(
      //             name: 'New Place ${DateTime.now()} $i',
      //             latLng: LatLng(48.858265 + i * 0.01, 2.350107))
      //     ]);
      //   },
      //   child: const Icon(Icons.update),
      // ),
    );
  }

  Future<Marker> Function(dynamic) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            if (kDebugMode) {
              print('---- $cluster');
            }
            cluster.items.forEach((p) => debugPrint(p));
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 45 : 30,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = TColors.accent;
    final Paint paint2 = Paint()..color = TColors.primary.withOpacity(0.3);

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.0, paint2);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.bytes(data.buffer.asUint8List());
  }
}
