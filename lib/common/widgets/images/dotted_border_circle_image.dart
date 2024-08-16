import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/circular_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'circular_image.dart';

class TDottedBorderCircleImage extends StatelessWidget {
  const TDottedBorderCircleImage({
    super.key,
    required this.image,
    this.status = true,
    this.imageSize = 80,
    this.isSvg = false,
    this.borderWidth = 2,
  });

  //final double posX,posY;
  final String image;
  final double imageSize, borderWidth;
  final bool status, isSvg;

  @override
  Widget build(BuildContext context) {
    //final controller = UserController.instance;
    return SizedBox(
      height: imageSize,
      width: imageSize,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              TCircularImage(
                isSvg: isSvg,
                image: image,
                fit: BoxFit.cover,
                height: imageSize,
                width: imageSize,
                padding: 0,
              ),
              DottedBorder(
                borderType: BorderType.Circle,
                color: TColors.primary,
                dashPattern: const [2, 2],
                strokeWidth: borderWidth,
                //borderPadding: const EdgeInsets.all(1),
                child: const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ],
          ),
          status
              ? const Positioned(
                  right: 5,
                  bottom: 5,
                  child: TCircularContainer(
                    padding: 0,
                    backgroundColor: TColors.green,
                    width: TSizes.md,
                    height: TSizes.md,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
