import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../../../common/styles/shimmer.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/images/upload_pic.dart';
import '../../../../app/controllers/user/user_controller.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.showCameraIcon = true,
    this.size = 115,
    this.borderColor = TColors.primary,
  });

  final String image;
  final bool showCameraIcon;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          /// user pic with dotted border
          Stack(
            children: [
              Obx(() {
                final networkImage = controller.user.image;
                final image = networkImage!.isNotEmpty
                    ?controller.user.image
                    : controller.imageURL;
                return controller.imageLoading.value
                    ? TSimmerEffect(
                        width: size,
                        height: size,
                        radius: 100,
                      )
                    : controller.isFileImage.value
                        ? TCircularImage(
                            imageFile: controller.fileImage.value,
                            isFile: controller.isFileImage.value,
                            height: size,
                            width: size,
                          )
                        : TCircularImage(
                            image: image!,
                            isNetworkImage: networkImage.isNotEmpty,
                            isSvg: networkImage.isEmpty,
                            height: size,
                            width: size,
                          );
              }),
              DottedBorder(
                borderType: BorderType.Circle,
                color: borderColor,
                dashPattern: const [4, 4],
                strokeWidth: 2,
                //borderPadding: const EdgeInsets.all(1),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),

          /// Camera Icon
          showCameraIcon
              ? Positioned(
                  right: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: TSizes.xl,
                    width: TSizes.xl,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        //side: const BorderSide(color: Colors.white),
                      ),
                      backgroundColor: Colors.grey[200],

                      onPressed: () => Get.bottomSheet(
                        UploadPhoto(
                          onCameraUpload: () async {
                            final photo = await THelperFunctions.uploadPicture(
                                ImageSource.camera);
                            if (photo != null) {
                              controller.isFileImage.value = true;
                              controller.fileImage.value = photo;
                            } else {
                              THelperFunctions.showAlert(
                                  TTexts.imageNotTake.tr, "");
                            }
                          },
                          onGalleryUpload: ()async{
                            final photo = await THelperFunctions.uploadPicture(
                                ImageSource.gallery);
                            if (photo != null) {
                                                controller.isFileImage.value = true;
                                                controller.fileImage.value = photo;
                            } else {
                              THelperFunctions.showAlert(
                                  TTexts.imageNotSelect.tr, "");
                            }
                          },
                        ),
                      ),

                      /// camera Icon
                      child: SvgPicture.asset(TImage.cameraIcon),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
