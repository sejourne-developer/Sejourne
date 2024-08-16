import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/status_container.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import 'package:sejourne/utils/popups/general_popups/login_popup_container.dart';
import '../../../../data/services/exporter.dart';
import '../../../../features/app/screens/home/widgets/icon_text_widget.dart';
import '../../../../features/messages/screens/chat/widgets/expanded_section.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../../../utils/popups/bookings_popups/booking_details_popup.dart';
import '../../../../utils/popups/home_popups/popup_expand_property_slider/popup_expand_property_slider.dart';
import '../../icons/circular_icon.dart';

class PropertyWidget extends StatelessWidget {
  const PropertyWidget({
    super.key,
    required this.propertyImage,
    required this.index,
    required this.isFav,
    required this.com,
    this.onPressed,
    this.margin = const EdgeInsetsDirectional.only(start: TSizes.sm),
    this.isSlidable = false,
    required this.heroTag,
  });

  final String propertyImage;
  final Rx<bool> isFav, com;
  final int index;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;
  final bool isSlidable;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    final token = TLocalStorage().readData('TOKEN');
    final dark = THelperFunctions.isDarkMode(context);
    Rx<bool> isExpanded = false.obs;
    return Column(
      children: [
        /// Property Main Container
        TRoundedContainer(
          onPressed: isSlidable
              ? () => isExpanded.value = !isExpanded.value
              : onPressed ??
                  () => Get.to(() => PropertyDetailScreen(
                        heroTag: heroTag,
                      )),
          height: 140,
          margin: margin,
          shadow: TShadowStyle.containerShadow,


          child: Row(
            children: [
              /// property Image
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadiusDirectional.only(
                      topStart: Radius.circular(TSizes.md - 2),
                      bottomStart: Radius.circular(TSizes.md)),
                  child: Stack(
                    children: [
                      /// Property Image
                      Hero(
                        tag: heroTag,
                        child: Image(
                          image: AssetImage(propertyImage),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: TDeviceUtils.getScreenWidth(context) * 0.50,
                        ),
                      ),

                      /// Apartment Container
                      Positioned(
                        left: TSizes.sm,
                        top: TSizes.sm,
                        child: StatusContainer(
                          isGradient: true,
                          padding: const EdgeInsets.all(TSizes.xs),
                          child: Text(
                            '1BR, Apartment',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .apply(color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Property Details
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Property Title
                        Text(TTexts.offerLabel,
                            style: Theme.of(context).textTheme.bodySmall),

                        /// Price and location row
                        Row(
                          children: [
                            /// money circle icon
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

                            /// title
                            RichText(
                              text: TextSpan(
                                text: 'د.إ13,000 ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: TColors.darkGrey,
                                    fontSize: 10),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '/Night',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                      //.apply(color: TColors.black),
                                      ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: TSizes.defaultSpace,
                            ),

                            /// icon and location text
                            const Expanded(
                              child: IconTextWidget(
                                title: 'JLT, Dubai',
                                icon: TImage.locationIcon,
                              ),
                            ),
                          ],
                        ),

                        /// property features row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// icon and beds text
                            Expanded(
                              child: IconTextWidget(
                                title: '1 Beds',
                                icon: TImage.bedRoomsIcon,
                              ),
                            ),

                            /// icon and bath text
                            Expanded(
                              child: IconTextWidget(
                                title: '1 Baths',
                                icon: TImage.bathIcon,
                              ),
                            ),

                            /// icon and sqft text
                            Expanded(
                              child: IconTextWidget(
                                title: '289 Sqft',
                                icon: TImage.mapIcon,
                              ),
                            ),
                          ],
                        ),

                        /// icon buttons row
                        Row(
                          children: [
                            /// Expand Icon Button
                            GestureDetector(
                              /// onTap open Expanded Property popup
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return BounceInDown(
                                        duration: const Duration(milliseconds: 500),
                                        child: const PopupExpandPropertySlider(
                                          banners: [
                                            TImage.prop1,
                                            TImage.prop2,
                                            TImage.prop3,
                                            TImage.prop4,
                                            TImage.prop5,
                                            TImage.prop6,
                                            TImage.prop7,
                                            TImage.prop8,
                                            TImage.prop9,
                                            TImage.prop10,
                                            TImage.prop11,
                                            TImage.prop12,
                                            TImage.prop13,
                                            TImage.prop14,
                                            TImage.prop15,
                                            TImage.prop16,
                                            TImage.property,
                                            TImage.property1,
                                            TImage.property2,
                                            TImage.property3,
                                            TImage.property4,
                                            TImage.property5,
                                            TImage.property6,
                                          ],
                                        ),
                                      );
                                    }),
                                child: SvgPicture.asset(
                                  TImage.expandIcon,
                                  width: TSizes.lg,
                                  height: TSizes.lg,
                                  colorFilter: ColorFilter.mode(
                                      dark
                                          ? TColors.darkIconColor
                                          : TColors.lightIconColor,
                                      BlendMode.srcIn),
                                )),
                            const SizedBox(
                              width: TSizes.sm,
                            ),

                            /// Favorite Icon Button
                            GestureDetector(
                                onTap: () => token != null
                                    ? isFav.value = !isFav.value
                                    : showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const LoginPopUpContainer()),
                                child: Obx(
                                  () => isFav.value
                                      ? SizedBox(
                                          width: TSizes.lg,
                                          height: TSizes.lg,
                                          child: Lottie.asset(
                                              TImage.animatedHeart,
                                              fit: BoxFit.contain,
                                              repeat: false),
                                        )
                                      : SizedBox(
                                          width: TSizes.lg,
                                          height: TSizes.lg,
                                          child: SvgPicture.asset(
                                            TImage.wishListIcon,
                                            // width: TSizes.lg,
                                            // height: TSizes.lg,
                                            colorFilter: ColorFilter.mode(
                                                dark
                                                    ? TColors.darkIconColor
                                                    : TColors.lightIconColor,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                )),
                            const SizedBox(
                              width: TSizes.sm,
                            ),

                            /// Compare Icon Button
                            GestureDetector(
                                onTap: () => com.value = !com.value,
                                child: Obx(
                                  () => SvgPicture.asset(
                                    com.value
                                        ? TImage.filledAddIcon
                                        : TImage.addIcon,
                                    width: TSizes.lg,
                                    height: TSizes.lg,
                                    colorFilter: ColorFilter.mode(
                                      dark
                                          ? com.value
                                              ? TColors.accent
                                              : TColors.darkIconColor
                                          : com.value
                                              ? TColors.accent
                                              : TColors.lightIconColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        /// Slidable Section
        isSlidable
            ? Obx(
                () => ExpandedSection(
                  expand: isExpanded.value,
                  child: SizedBox(
                    height: TDeviceUtils.getScreenHeight() * 1.25,
                    child: const BookingDetailsPopup(
                      showBorder: false,
                      ignoreAppBar: true,
                      radius: 0,
                      physics: NeverScrollableScrollPhysics(),
                      margin: EdgeInsets.zero,
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
