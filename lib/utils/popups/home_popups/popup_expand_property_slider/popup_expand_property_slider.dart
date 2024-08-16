import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sejourne/features/app/controllers/home/home_controller.dart';
import 'package:sejourne/utils/device/device_utility.dart';
import 'package:sejourne/utils/popups/home_popups/popup_expand_property_slider/widgets/popup_expand_property_bottom_buttons.dart';
import '../../../../common/widgets/texts/section_header.dart';
import '../../../../features/app/screens/property_details/widgets/details_widget.dart';
import '../../../../features/app/screens/property_details/widgets/features_widget.dart';
import '../../../../features/app/screens/property_details/widgets/summary_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';


class PopupExpandPropertySlider extends StatelessWidget {
  const PopupExpandPropertySlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return CarouselSlider(
        options: CarouselOptions(
          //initialPage: 0,
          viewportFraction: 0.8,
          height: double.infinity,
          pageSnapping: true,
          enlargeCenterPage: true,
          scrollPhysics: const AlwaysScrollableScrollPhysics(),
          enableInfiniteScroll: true,
          onPageChanged: (index, _) =>
              controller.updateExpandPageIndicator(index),
          //padEnds: false
        ),
        items: banners
            .map(
              (url) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  child: Card(
                    color: THelperFunctions.isDarkMode(context)
                        ? TColors.dark
                        : TColors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(TSizes.md))),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: ClipRRect(
                        borderRadius: const BorderRadiusDirectional.all(Radius.circular(TSizes.md)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// -- Product Image
                              Container(
                                width: double.infinity,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          url,
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(TSizes.md - 2),
                                        topRight:
                                            Radius.circular(TSizes.md - 2))),
                              ),
                        
                              /// Product Details
                              Container(
                                width: TDeviceUtils.getScreenWidth(context) * 0.8,
                                padding: const EdgeInsets.only(
                                    right: TSizes.md,
                                    left: TSizes.md,
                                    bottom: TSizes.md,
                                    top: TSizes.defaultSpace),
                                child: Column(
                                  children: [
                                    /// -- Summary Button
                                    const Summary(),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),
                        
                                    /// -- About this Listing
                                    const TSectionHeading(
                                      title: 'About this Listing',
                                      showActionButton: false,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                    Text(
                                      'Sejourne Holiday Homes is happy to offer you a brand new Elegant Studio at partially overlooking the lake.JLT is a vibrant mixed-use Free Zone. High-rise towers look out over manmade lakes, while a world of cafés, restaurants, retail and lifestyle awaits at ground and podium level. Perfect for your next leisure or business trips or simply if you are a resident in need of a sta....',
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .apply(color: TColors.darkGrey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),
                        
                                    /// -- Details
                                    const DetailsWidget(),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),
                        
                                    /// -- features
                                    const FeaturesWidget(
                                      popup: true,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      bottomNavigationBar:
                          const PopupExpandPropertyBottomButtons(),
                    ),
                  )),
            )
            .toList());
  }
}
