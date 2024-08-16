import 'package:dotted_border/dotted_border.dart';
import 'package:sejourne/data/services/exporter.dart';

class DottedCircleBorderIcon extends StatelessWidget {
  const DottedCircleBorderIcon({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.padding = TSizes.lg,
    this.borderColor,
    this.iconSize = TSizes.iconMd,
  });

  final String icon;
  final Color? backgroundColor, borderColor;
  final double padding, iconSize;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor ?? (dark ? TColors.dark : TColors.white),
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        padding: EdgeInsets.zero,
        width: TDeviceUtils.getScreenWidth(context) * 0.4,
        height: TDeviceUtils.getScreenWidth(context) * 0.4,
        child: DottedBorder(
          borderType: BorderType.Circle,
          color: borderColor ??
              (dark ? TColors.lightPrimaryBorderColor : TColors.primary),
          dashPattern: const [2, 2],
          strokeWidth: 1,
          child: Center(
              child: SvgPicture.asset(
            icon,
            fit: BoxFit.cover,
            height: iconSize,
            width: iconSize,
            colorFilter: ColorFilter.mode(
                dark ? TColors.darkIconColor : TColors.primary,
                BlendMode.srcIn),
          )),
        ),
      ),
    );
  }
}
