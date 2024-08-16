
import 'package:image_picker/image_picker.dart';
import 'package:sejourne/common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/upload_pic.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../data/services/exporter.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key, required this.images});

  final RxList images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Obx(
        () => Row(
          children: [
            TRoundedContainer(
              height: 56,
              width: 56,
              onPressed: () => Get.bottomSheet(
                UploadPhoto(
                  onCameraUpload: () async {
                    final photo = await THelperFunctions.uploadPicture(
                        ImageSource.camera);
                    if (photo != null) {
                      images.add(photo);
                    } else {
                      THelperFunctions.showAlert(
                          TTexts.imageNotTake.tr, "");
                    }
                  },
                  onGalleryUpload: ()async{
                    final photo = await THelperFunctions.uploadPicture(
                        ImageSource.gallery);
                    if (photo != null) {
                      images.add(photo);
                    } else {
                      THelperFunctions.showAlert(
                          TTexts.imageNotSelect.tr, "");
                    }
                  },
                ),
              ),
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkContainer
                  : TColors.softGrey,
              radius: TSizes.sm,
              padding: const EdgeInsets.all(TSizes.sm),
              child: SvgPicture.asset(
                TImage.cameraIcon,
                colorFilter:
                    const ColorFilter.mode(TColors.grey2, BlendMode.srcIn),
              ),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),

            ListLayout(
              itemCount: images.length,
              separatorWidth: TSizes.sm,
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Stack(
                  children: [
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(TSizes.sm)),
                        child: Image(
                          image: FileImage(images[index]) as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 4,
                      end: 4,
                      child: TCircularIcon(
                        onPressed: () => images.removeAt(index),
                        icon: TImage.clearIcon,
                        padding: TSizes.xs,
                        height: TSizes.md,
                        width: TSizes.md,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


