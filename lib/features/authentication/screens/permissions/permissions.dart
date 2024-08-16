import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/authentication/controllers/permissions/permissions_controller.dart';
import 'package:sejourne/features/authentication/screens/permissions/widgets/permissions_page.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PermissionsController.instance;
    return Obx(
      () => CarouselSlider(
        carouselController: controller.carouselControllerImpl,
        options: CarouselOptions(
          initialPage: controller.carousalCurrentIndex.value,
          viewportFraction: 1,
          height: double.infinity,
          pageSnapping: true,
          enlargeCenterPage: true,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          //enableInfiniteScroll: true,
          onPageChanged: (index, _) => controller.updatePageIndicator(index),

          padEnds: false,
        ),
        items: [
          /// Location Permission
          PermissionsPage(
            image: TImage.locationPermissionsIcon,
            title: TTexts.locationPermissionTitle.tr,
            subTitle: TTexts.locationPermissionSubTitle.tr,
            onBoardingDescription: TTexts.locationPermissionDescription.tr,
            allowOnPressed: () async {
              final permission = await THelperFunctions.requestPermission(
                  permission: Permission.location);
              if (permission.isGranted) {
                controller.allow("location_permission");
              } else {
                controller.deny("location_permission");
              }
            },
            denyOnPressed: () => controller.deny("location_permission"),
          ),

          /// Camera Permission
          PermissionsPage(
            image: TImage.cameraPermissionsIcon,
            title: TTexts.cameraPermissionTitle.tr,
            subTitle: TTexts.cameraPermissionSubTitle.tr,
            onBoardingDescription: TTexts.cameraPermissionDescription.tr,
            allowOnPressed: () async {
              final permission = await THelperFunctions.requestPermission(
                  permission: Permission.camera);
              if (permission.isGranted) {
                controller.allow("camera_permission");
              } else {
                controller.deny("camera_permission");
              }
            },
            denyOnPressed: () => controller.deny("camera_permission"),
          ),

          /// Contact Permission
          // PermissionsPage(
          //   image: TImage.contactsPermissionsIcon,
          //   title: TTexts.contactPermissionTitle.tr,
          //   subTitle: TTexts.contactPermissionSubTitle.tr,
          //   onBoardingDescription: TTexts.contactPermissionDescription.tr,
          //   allowOnPressed: () async {
          //     final permission = await THelperFunctions.requestPermission(
          //         permission: Permission.contacts);
          //     if (permission.isGranted) {
          //       controller.allow("contacts_permission");
          //     } else {
          //       controller.deny("contacts_permission");
          //     }
          //   },
          //   denyOnPressed: () => controller.deny("contacts_permission"),
          // ),

          /// Storage Permission
          PermissionsPage(
            image: TImage.storagePermissionsIcon,
            title: TTexts.storagePermissionTitle.tr,
            subTitle: TTexts.storagePermissionSubTitle.tr,
            onBoardingDescription: TTexts.storagePermissionDescription.tr,
            allowOnPressed: () async {
              final permission = await THelperFunctions.requestPermission(
                  permission: Platform.isAndroid
                      ? Permission.storage
                      : Permission.photos);
              if (permission.isGranted) {
                controller.allow("storage_permission");
              } else {
                controller.deny("storage_permission");
              }
            },
            denyOnPressed: () => controller.deny("storage_permission"),
          ),

          /// Microphone Permission
          // PermissionsPage(
          //   image: TImage.micPermissionsIcon,
          //   title: TTexts.micPermissionTitle.tr,
          //   subTitle: TTexts.micPermissionSubTitle.tr,
          //   onBoardingDescription: TTexts.micPermissionDescription.tr,
          //   allowOnPressed: () async {
          //     final permission = await THelperFunctions.requestPermission(
          //         permission: Permission.microphone);
          //     if (permission.isGranted) {
          //       controller.allow("mic_permission");
          //     } else {
          //       controller.deny("mic_permission");
          //     }
          //   },
          //   denyOnPressed: () => controller.deny("mic_permission"),
          // ),

          /// Notification Permission
          PermissionsPage(
            image: TImage.notificationIcon1,
            title: TTexts.notificationsPermissionTitle.tr,
            subTitle: TTexts.notificationsPermissionSubTitle.tr,
            onBoardingDescription: TTexts.notificationsPermissionDescription.tr,
            allowOnPressed: () async {
              final permission = await THelperFunctions.requestPermission(
                  permission: Permission.notification);
              if (permission.isGranted) {
                controller.allow("notification_permission");
              } else {
                controller.deny("notification_permission");
              }
            },
            denyOnPressed: () => controller.deny("notification_permission"),
          ),

          /// Calendar Permission
          // PermissionsPage(
          //   image: TImage.calenderPermissionsIcon,
          //   title: TTexts.calendarPermissionTitle.tr,
          //   subTitle: TTexts.calendarPermissionSubTitle.tr,
          //   onBoardingDescription: TTexts.calendarPermissionDescription.tr,
          //   allowOnPressed: () async {
          //     final permission = await THelperFunctions.requestPermission(
          //         permission: Permission.calendarWriteOnly);
          //     if (permission.isGranted) {
          //       controller.allow("calender_permission");
          //     } else {
          //       controller.deny("calender_permission");
          //     }
          //   },
          //   denyOnPressed: () => controller.deny("calender_permission"),
          // ),
        ],
      ),
    );
  }
}
