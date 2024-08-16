import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/services/exporter.dart';

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({
    super.key,
    required this.onCameraUpload,
    required this.onGalleryUpload,
  });

  final VoidCallback onCameraUpload;
  final VoidCallback onGalleryUpload;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context)
            ? TColors.blackContainer
            : TColors.lightContainer,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      child: Wrap(
        alignment: WrapAlignment.end,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          ListTile(
            leading: Icon(
              Icons.camera,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkIconColor
                  : TColors.lightIconColor,
            ),
            title: Text(
              TTexts.cameraTitle.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () async {
              Get.back();

              if (await Permission.camera.isGranted) {
                onCameraUpload();
              } else if (await Permission.camera.isDenied) {
                if (await Permission.camera.request().isGranted) {
                  onCameraUpload();
                } else {
                  THelperFunctions.showAlert("${TTexts.accessTo.tr} ${TTexts.cameraTitle.tr} ${TTexts.isDenied.tr}",
                      "${TTexts.pleaseEnable.tr} ${TTexts.cameraTitle.tr} ${TTexts.accessTo.tr} ${TTexts.uploadPhoto.tr}");
                }
              }
            },
          ),
          ListTile(
            leading: Icon(
              Icons.image,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.darkIconColor
                  : TColors.lightIconColor,
            ),
            title: Text(
              TTexts.gallery.tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () async {
              Get.back();
              final status = Platform.isAndroid
                  ? await Permission.storage.status
                  : await Permission.photos.status;
              if (status.isGranted) {
                onGalleryUpload();
              } else if (status.isDenied) {
                if (Platform.isAndroid
                    ? await Permission.storage.request().isGranted
                    : await Permission.photos.request().isGranted) {
                  onGalleryUpload();
                } else {
                  THelperFunctions.showAlert("${TTexts.accessTo.tr} ${TTexts.gallery.tr} ${TTexts.isDenied.tr}",
                      "${TTexts.pleaseEnable.tr} ${TTexts.storageTitle.tr} ${TTexts.accessTo.tr} ${TTexts.uploadPhoto.tr}");
                }
              }
            },
          ),
        ],
      ),
    );
  }
}