import 'package:sejourne/common/widgets/icons/dotted_circle_border_icon.dart';
import 'package:sejourne/data/services/exporter.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer(
      {super.key, required this.title, required this.note, required this.time});

  final String title, note, time;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 88,
      //width: double.infinity,
      shadow: TShadowStyle.containerShadow,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Notification Icon
          Expanded(
            flex: 2,
            child: DottedCircleBorderIcon(
              padding: TSizes.md,
              icon: TImage.notificationIcon2,
              backgroundColor:
                  dark ? TColors.blackContainer : TColors.softGrey,
            ),
          ),

          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                end: TSizes.md,
                bottom: TSizes.sm,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///  Notification title
                      Expanded(
                        flex: 3,
                        child: Text(title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(
                                    color: dark
                                        ? TColors.darkFontColor
                                        : TColors.primary)),
                      ),
                      Text(
                        time,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.displayMedium!.apply(
                            color:
                                dark ? TColors.darkFontColor : TColors.primary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
                  Text(note,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
