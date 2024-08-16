import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../../common/widgets/images/rounded_image.dart';
import '../../../../controllers/product_details/product_details_controller.dart';
import 'property_details_app_bar.dart';
import 'property_image_slider_thumb.dart';

class PropertyImageSlider extends StatelessWidget {
  const PropertyImageSlider({
    super.key,
    required this.banners,
    required this.heroTage,
  });

  final List<String> banners;
  final String heroTage;

  @override
  Widget build(BuildContext context) {
    List<String> arrayImages = const [
      "https://sejourne.ae/wp-content/uploads/2024/03/2-24.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/3-26.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/4-26.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/5-25.jpg",
      "https://sejourne.ae/wp-content/uploads/2024/03/6-24.jpg",
    ];
    final controller = Get.put(ProductDetailsController());
    controller.currentImagePageIndex.value = banners.length - 1;
    return Stack(
      children: [
        Hero(
          tag: heroTage,
          child: Container(
            height: 220,
            padding: const EdgeInsets.all(TSizes.xs),
            child: PageView(
              controller: controller.imagePageController,
              onPageChanged: controller.updatePageIndicator,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TRoundedImage(
                      onPressed: () {
                        /// Full Screen Image Slider
                        FullscreenImageViewer.open(
                          context: context,
                          child: Material(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                TAppBar(
                                  showBackArrow: false,
                                  actions: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.symmetric(
                                              horizontal: 8.0),
                                      child: TCircularIcon(
                                        height: TSizes.iconMd,
                                        width: TSizes.iconMd,
                                        icon: TImage.clearIcon,
                                        onPressed: () => Get.back(),
                                      ),
                                    )
                                  ],
                                ),
                                flexiProductimageSlider(
                                  arrayImages: arrayImages,
                                  sliderStyle: SliderStyle.nextToSlider,
                                  aspectRatio: 0.6,
                                  boxFit: BoxFit.contain,
                                  selectedImagePosition: i,
                                  thumbnailAlignment: ThumbnailAlignment.bottom,
                                  thumbnailBorderType:
                                      ThumbnailBorderType.bottom,
                                  thumbnailBorderWidth: 1.5,
                                  thumbnailBorderRadius: TSizes.xs,
                                  thumbnailWidth: 55,
                                  thumbnailHeight: 55,
                                  thumbnailBorderColor: TColors.accent,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      borderRadius: TSizes.md,
                      imageUrl: banners[i]),
              ],
            ),
          ),
        ),

        /// Image Slider
        PositionedDirectional(
          start: TDeviceUtils.getScreenWidth(context) * 0.06,
          end: TDeviceUtils.getScreenWidth(context) * 0.06,
          bottom: 20,
          child: PropertyImageSliderThumb(
            banners: banners,
          ),
        ),

        /// Appbar Icons
        const PropertyDetailsAppBar(),
      ],
    );
  }
}
