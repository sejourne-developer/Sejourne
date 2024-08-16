import 'package:text_scroll/text_scroll.dart';

import '../../../data/services/exporter.dart';

class IconTitleSubTitle extends StatelessWidget {
  const IconTitleSubTitle({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.showBorder = true,
  });

  final String icon, title, subTitle;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
          border: showBorder
              ? BorderDirectional(
              end: BorderSide(
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.darkPrimaryBorderColor
                      : TColors.grey,
                  width: 1))
              : null),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: TSizes.iconMd,
            width: TSizes.iconMd,
          ),
          const SizedBox(height: TSizes.xs,),
          TextScroll(
            title,
            mode: TextScrollMode.bouncing,
            velocity: const Velocity(pixelsPerSecond: Offset(TSizes.sm, 0)),
            delayBefore: const Duration(seconds: 1),
            numberOfReps: 5,
            pauseBetween: const Duration(milliseconds: 500),
            selectable: true,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}