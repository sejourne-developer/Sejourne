import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';

class PropertyDetailsGalleryWidget extends StatelessWidget {
  const PropertyDetailsGalleryWidget({super.key, required this.banners});

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final List<UniqueKey> tag = [
      UniqueKey(),
      UniqueKey(),
      UniqueKey(),
      UniqueKey(),
      UniqueKey()
    ];
    return  Column(
      children: [
        /// Section Heading
        TSectionHeading(
          title: TTexts.gallery.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),

        /// Gallery items
        TGridLayout(
          itemCount: banners.length,
          crossAxisSpacing: TSizes.sm,
          mainAxisSpacing: TSizes.sm,
          mainAxisExtent: TSizes.productImageSize,
          itemBuilder: (_, index) => Hero(
            tag: tag[index],
            child: TRoundedImage(
              onPressed: () => Navigator.push(
                context,
                PageRouteBuilder(
                  opaque: false,
                  barrierColor: Colors.transparent,
                  pageBuilder: (BuildContext context, _, __) =>
                      Scaffold(
                        backgroundColor:
                        TColors.black.withOpacity(0.5),
                        appBar: TAppBar(
                          showBackArrow: false,
                          actions: [
                            Padding(
                              padding: const EdgeInsetsDirectional
                                  .symmetric(horizontal: TSizes.md),
                              child: TCircularIcon(
                                height: TSizes.iconLg,
                                width: TSizes.iconLg,
                                icon: TImage.clearIcon,
                                onPressed: () => Get.back(),
                              ),
                            )
                          ],
                        ),
                        body: InteractiveViewer(
                          child: Hero(
                            tag: tag[index],
                            child: Center(
                              child: Image.asset(
                                banners[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                ),
              ),
              margin: EdgeInsets.zero,
              width: TSizes.productImageSize,
              borderRadius: TSizes.sm,
              imageUrl: banners[index],
              fit: BoxFit.contain,
            ),
          ),
          crossAxisCount: 3,
        ),
      ],
    );
  }
}
