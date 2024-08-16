// import 'dart:async';
// import 'dart:ui' as ui;
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_cluster_manager_2/google_maps_cluster_manager_2.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sejourne/features/app/controllers/map/place.dart';
//
//
// class MapController extends GetxController {
//   // static var zoom = 10.0;
//   // final Completer<GoogleMapController> controller =
//   //     Completer<GoogleMapController>();
//   //
//   // static const CameraPosition kGooglePlex = CameraPosition(
//   //   target: LatLng(25.276987, -55.296249),
//   //   zoom: 14.4746,
//   // );
//
//   late ClusterManager manager;
//   late ClusterManager manager2;
//
//   Completer<GoogleMapController> controller = Completer();
//
//   Set<Marker> markers = {};
//   Set<Marker> markers2 = {};
//
//   final CameraPosition parisCameraPosition =
//       const CameraPosition(target: LatLng(48.856613, 2.352222), zoom: 12.0);
//
//   List<Place> items = [
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Restaurant $i',
//           isClosed: i % 2 == 0,
//           latLng: LatLng(48.858265 - i * 0.001, 2.350107 + i * 0.001)),
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Bar $i',
//           latLng: LatLng(48.858265 + i * 0.01, 2.350107 - i * 0.01)),
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Hotel $i',
//           latLng: LatLng(48.858265 - i * 0.1, 2.350107 - i * 0.01)),
//   ];
//
//   List<Place> items2 = [
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Place $i',
//           latLng: LatLng(48.848200 + i * 0.001, 2.319124 + i * 0.001)),
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Test $i',
//           latLng: LatLng(48.858265 + i * 0.1, 2.350107 + i * 0.1)),
//     for (int i = 0; i < 10; i++)
//       Place(
//           name: 'Test2 $i',
//           latLng: LatLng(48.858265 + i * 1, 2.350107 + i * 1)),
//   ];
//
//   @override
//   void onInit() {
//     manager = ClusterManager<Place>(items, _updateMarkers,
//         markerBuilder: _getMarkerBuilder(Colors.red)) as ClusterManager<ClusterItem>;
//
//     manager2 = ClusterManager<Place>(items2, _updateMarkers2,
//         markerBuilder: _getMarkerBuilder(Colors.blue)) as ClusterManager<ClusterItem>;
//     super.onInit();
//   }
//
//   void _updateMarkers(Set<Marker> markers) {
//     this.markers = markers;
//     update();
//   }
//
//   void _updateMarkers2(Set<Marker> markers) {
//
//     markers2 = markers;
//
//     update();
//   }
//
//   Future<Marker> Function(dynamic) _getMarkerBuilder(
//           Color color) =>
//       (cluster) async {
//         return Marker(
//           markerId: MarkerId(cluster.getId()),
//           position: cluster.location,
//           onTap: () {
//             if (kDebugMode) {
//               print('---- $cluster');
//             }
//             for (var p in cluster.items) {
//               if (kDebugMode) {
//                 print(p);
//               }
//             }
//           },
//           icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75, color,
//               text: cluster.isMultiple ? cluster.count.toString() : null),
//         );
//       };
//
//   Future<BitmapDescriptor> _getMarkerBitmap(int size, Color color,
//       {String? text}) async {
//     if (kIsWeb) size = (size / 2).floor();
//
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//     final Paint paint1 = Paint()..color = color;
//     final Paint paint2 = Paint()..color = Colors.white;
//
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
//     canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);
//
//     if (text != null) {
//       TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
//       painter.text = TextSpan(
//         text: text,
//         style: TextStyle(
//             fontSize: size / 3,
//             color: Colors.white,
//             fontWeight: FontWeight.normal),
//       );
//       painter.layout();
//       painter.paint(
//         canvas,
//         Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
//       );
//     }
//
//     final img = await pictureRecorder.endRecording().toImage(size, size);
//     final data =
//         await img.toByteData(format: ui.ImageByteFormat.png) as ByteData;
//
//     return BitmapDescriptor.bytes(data.buffer.asUint8List());
//   }
// }
