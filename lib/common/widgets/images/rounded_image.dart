import 'package:flutter/material.dart';
import 'package:sejourne/common/styles/shadows.dart';

import '../../../utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
    this.child,
    this.margin = const EdgeInsets.symmetric(horizontal: TSizes.sm),
    this.isPromo = false,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final bool isPromo;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding, margin;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: isPromo
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    )
                  : null,
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backgroundColor,
            boxShadow: [TShadowStyle.containerShadow],
          ),
          child: child
          // ClipRRect(
          //   borderRadius: applyImageRadius
          //       ? BorderRadius.circular(borderRadius)
          //       : BorderRadius.zero,
          //   child: Image(
          //     image: isNetworkImage
          //         ? NetworkImage(imageUrl)
          //         : AssetImage(imageUrl) as ImageProvider,
          //     fit: fit,
          //   ),
          // ),
          ),
    );
  }
}
