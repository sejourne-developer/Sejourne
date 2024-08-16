import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import '../../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../app/screens/home/widgets/icon_text_widget.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({
    super.key,
    required this.propertyImage,
  });

  final String propertyImage;

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      onPressed: () => Get.to(() => const PropertyDetailScreen(
        heroTag: "PropertyDetailsHeroTag2",
      )),
      height: 140,
      showBorder: true,
      isGradient: false,
      padding: EdgeInsets.zero,
      shadow: TShadowStyle.containerShadow,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(TSizes.md - 2),
                  bottomStart: Radius.circular(TSizes.md)),
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(propertyImage),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: TDeviceUtils.getScreenWidth(context) * 0.50,
                  ),
                  Positioned(
                      left: TSizes.sm,
                      top: TSizes.sm,
                      child: TRoundedContainer(
                        isGradient: true,
                        showBorder: false,
                        padding: const EdgeInsets.all(TSizes.xs),
                        child: Text(
                          'Apartment',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .apply(color: TColors.white),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(TTexts.offerLabel,
                        style: Theme.of(context).textTheme.bodySmall),
                    const IconTextWidget(
                      title: 'Dubai Arch (JLT), Dubai, UAE.',
                      icon: TImage.locationIcon,
                    ),
                    Row(
                      children: [
                        const TCircularIcon(
                          icon: TImage.moneyIcon,
                          padding: 2,
                          showBorder: false,
                          height: TSizes.md,
                          width: TSizes.md,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'د.إ13,000 ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: TColors.darkGrey,
                                fontSize: 10),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '/${TTexts.nightLabel.tr}',
                                  style: Theme.of(context).textTheme.labelSmall!
                                  //.apply(color: TColors.black),
                                  ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.defaultSpace,
                        ),
                        const Expanded(
                          child: IconTextWidget(
                            title: 'Apartment # 1201',
                            icon: TImage.hash,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: IconTextWidget(
                            title: '1 Beds',
                            icon: TImage.bedRoomsIcon,
                          ),
                        ),
                        Expanded(
                          child: IconTextWidget(
                            title: '1 Baths',
                            icon: TImage.bathIcon,
                          ),
                        ),
                        Expanded(
                          child: IconTextWidget(
                            title: '289 Sqft',
                            icon: TImage.mapIcon,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
