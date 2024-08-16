import '../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../../data/services/exporter.dart';
import '../../../../controllers/product_details/product_details_controller.dart';

class PropertyImageSliderThumb extends StatelessWidget {
  const PropertyImageSliderThumb({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = ProductDetailsController.instance;
    return SizedBox(
      height: 40,
      width: double.infinity,
      // padding: EdgeInsetsDirectional.symmetric(horizontal: TDeviceUtils.getScreenWidth(context)*0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Previous Image Button
          InkWell(
            onTap: () => controller.prevImagePage(),
            child: const TCircularContainer(
              width: TSizes.iconXs,
              height: double.infinity,
              margin: EdgeInsetsDirectional.only(end: 10),
              backgroundColor: TColors.grey,
              child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: TSizes.sm,
                  )),
            ),
          ),

          /// Image Thumb
          Flexible(
            child: ListLayout(
                itemCount: banners.length,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorWidth: TSizes.xs,
                itemBuilder: (_, index) => TRoundedImage(
                  onPressed: () {
                    controller.currentImagePageIndex.value = index;
                    controller.updatePageIndicator(index);
                    controller.imageNavigationClick(index);
                  },
                  borderRadius: TSizes.sm,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  imageUrl: banners[index],
                  width: 56,
                  border:
                  Border.all(color: TColors.white, width: 1),
                )),
          ),
          const SizedBox(
            width: TSizes.sm,
          ),

          /// Next Image Button
          InkWell(
            onTap: () => controller.nextImagePage(banners.length - 1),
            child: const TCircularContainer(
              width: TSizes.iconXs,
              height: double.infinity,
              backgroundColor: TColors.grey,
              child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: TSizes.sm,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
