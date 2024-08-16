import 'package:iconsax/iconsax.dart';


import '../../../data/services/exporter.dart';
import '../../../features/personalization/controllers/payment_controller.dart';
import '../../validators/validation.dart';
import 'primary_popup_container.dart';

class AddCardPopUpForm extends StatelessWidget {
  const AddCardPopUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(PaymentController());
    return Material(
      color: Colors.transparent,
      child: PrimaryPopupContainer(
        headIcon: TImage.cardIcon3,
        title: TTexts.linkCardTitle.tr,
        subTitle: TTexts.linkCardSubTitle.tr,
        buttonText: TTexts.saveLabel.tr,
        onPressed: () {
          if (!controller.linkCardForm.currentState!.validate()) {
            return;
          }
        },
        child: Form(
          key: controller.linkCardForm,
          child: Column(
            children: [
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.nameOnCard,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.nameOnCard.tr,
                      prefixIcon: Icon(
                        Iconsax.user,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.nameOnCard.tr, value!),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: TextFormField(
                  controller: controller.cardNum,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.cardNum.tr,
                      prefixIcon: Icon(
                        Iconsax.hashtag,
                        color: dark ? TColors.darkIconColor : TColors.primary,
                      )),
                  validator: (value) =>
                      TValidator.validateEmptyText(TTexts.cardNum.tr, value!),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.exDate,
                        expands: false,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.sm + 4,
                                horizontal: TSizes.sm + 4),
                            child: SvgPicture.asset(
                              TImage.searchBookingIcon,
                              colorFilter: ColorFilter.mode(
                                  dark
                                      ? TColors.darkIconColor
                                      : TColors.primary,
                                  BlendMode.srcIn),
                              width: 8,
                              height: 8,
                            ),
                          ),
                          labelText: "MM/YY",
                          labelStyle: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.grey)
                        ),
                        validator: (value) =>
                            TValidator.validateEmptyText(TTexts.dateEnd.tr, value!),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwInputField,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.cvv,
                        expands: false,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.barcode),
                          labelText: "CVV",
                        ),
                        validator: (value) =>
                            TValidator.validateEmptyText('cvv', value!),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
