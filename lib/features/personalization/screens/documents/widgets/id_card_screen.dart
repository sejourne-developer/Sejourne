import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/personalization/controllers/documents_controller.dart';
import 'package:sejourne/features/personalization/screens/payment/widgets/card_container.dart';
import '../../../../../common/widgets/images/upload_pic.dart';
import '../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../utils/popups/general_popups/primary_popup_container.dart';
import '../../../../../utils/validators/validation.dart';

class IdCardScreen extends StatelessWidget {
  const IdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = DocumentsController.instance;

    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// App bar
               TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.iDCard.tr),
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text(
                TTexts.documentHaveUse.tr,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: Get.isDarkMode
                        ? TColors.darkFontColor
                        : TColors.darkerGrey),
              ),

              ListLayout(
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => const CardContainer(
                        cardName: 'Catalin Pustai',
                        cardNum: 'XYZ1223A',
                        icon: TImage.idIcon,
                        iconColor: TColors.primary,
                        cardExpDate: 'Exp: 01/12/2040',
                        cardCvv: '',
                      ),
                  itemCount: 2),

              const SizedBox(
                height: TSizes.md,
              ),
              InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => PrimaryPopupContainer(
                    headIcon: TImage.idIcon,
                    title: TTexts.iDCardDetails.tr,
                    subTitle: TTexts.uploadIDCard.tr,
                    buttonText: TTexts.saveLabel.tr,
                    onPressed: () {
                      if (!controller.addIdFormKey.currentState!.validate()) {
                        return;
                      }
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: TSizes.md),
                      child: Form(
                        key: DocumentsController.instance.addIdFormKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: TSizes.md,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        controller.idFirstNameController,
                                    expands: false,
                                    decoration: InputDecoration(
                                      labelText: TTexts.fName.tr,
                                    ),
                                    validator: (value) =>
                                        TValidator.validateEmptyText(
                                            TTexts.fName.tr, value!),
                                  ),
                                ),
                                const SizedBox(
                                  width: TSizes.spaceBtwInputField,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: controller.idLastNameController,
                                    expands: false,
                                    decoration: InputDecoration(
                                      labelText: TTexts.lName.tr,
                                    ),
                                    validator: (value) =>
                                        TValidator.validateEmptyText(
                                            TTexts.lName.tr, value!),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: TSizes.md,
                            ),
                            InkWell(
                              onTap: () => Get.bottomSheet(
                                UploadPhoto(
                                  onCameraUpload: () async {
                                    final photo =
                                        await THelperFunctions.uploadPicture(
                                            ImageSource.camera);
                                    if (photo != null) {
                                      controller.isIDFileImage.value = true;
                                      controller.idFileImage.value = photo;
                                    } else {
                                      THelperFunctions.showAlert(
                                          TTexts.imageNotTake.tr, "");
                                    }
                                  },
                                  onGalleryUpload: () async {
                                    final photo =
                                        await THelperFunctions.uploadPicture(
                                            ImageSource.gallery);
                                    if (photo != null) {
                                      controller.isIDFileImage.value = true;
                                      controller.idFileImage.value = photo;
                                    } else {
                                      THelperFunctions.showAlert(
                                          TTexts.imageNotSelect.tr, "");
                                    }
                                  },
                                ),
                              ),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                padding: const EdgeInsets.all(TSizes.xs),
                                dashPattern: const [4, 4],
                                color: THelperFunctions.isDarkMode(context)
                                    ? TColors.lightPrimaryBorderColor
                                    : TColors.primary,
                                radius: const Radius.circular(TSizes.md),
                                child: SizedBox(
                                  height: TDeviceUtils.getScreenHeight() * 0.2,
                                  width: double.infinity,
                                  child: Obx(
                                    () => controller.isIDFileImage.value
                                        ? ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(TSizes.md)),
                                            child: Image(
                                              image: FileImage(controller
                                                  .idFileImage
                                                  .value!) as ImageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Center(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .symmetric(
                                                      horizontal: TDeviceUtils
                                                              .getScreenWidth(
                                                                  context) *
                                                          0.2),
                                              child:  Text(
                                                TTexts.tapToUploadID.tr,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.md,
                            ),
                            TextFormField(
                              controller: controller.idExpiryDateController,
                              expands: false,
                              decoration:  InputDecoration(
                                labelText: TTexts.expiryOfID.tr,
                              ),
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      TTexts.expiryOfID.tr, value!),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                child: TRoundedContainer(
                  width: double.infinity,
                  radius: TSizes.sm,
                  shadow: TShadowStyle.containerShadow,
                  padding: const EdgeInsetsDirectional.all(TSizes.md),
                  child: Center(
                    child: Text(
                      TTexts.addIDCard.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.darkFontColor
                              : TColors.grey2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
