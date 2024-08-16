import 'package:dotted_border/dotted_border.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../../../../../common/widgets/texts/vertical_title_sub_title_widget.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.cardName,
    required this.cardNum,
    required this.cardExpDate,
    required this.cardCvv,
    this.icon = TImage.cardIcon2,
    this.iconColor,
  });

  final String cardName, cardNum, cardExpDate, cardCvv, icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      height: 88,
      showBorder: true,
      isGradient: false,
      padding: EdgeInsets.zero,
      shadow: TShadowStyle.containerShadow,
      child: Row(
        children: [
          /// icon
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: dark ? TColors.grey2 : TColors.darkPrimaryBorderColor,
                  dashPattern: const [2, 2],
                  strokeWidth: 1,
                  borderPadding: const EdgeInsets.all(1),
                  child: Center(
                      child: SvgPicture.asset(
                    icon,
                    colorFilter: ColorFilter.mode(
                        THelperFunctions.isDarkMode(context)
                            ? TColors.darkIconColor
                            : iconColor ?? TColors.lightIconColor,
                        BlendMode.srcIn),
                  )),
                ),
              )),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                vertical: TSizes.sm,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(cardName,
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: dark
                                ? TColors.darkFontColor
                                : TColors.primary)),
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(end: TSizes.md),
                      child: Text(cardNum,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      VerticalTitleSubTitleWidget(
                        titleStyle: Theme.of(context).textTheme.labelSmall,
                        subTitleStyle: Theme.of(context).textTheme.labelSmall,
                        title: "Ex:",
                        subTitle: cardExpDate,
                      ),
                      const SizedBox(
                        width: TSizes.md,
                      ),
                      cardCvv != ''
                          ? VerticalTitleSubTitleWidget(
                              titleStyle:
                                  Theme.of(context).textTheme.labelSmall,
                              subTitleStyle:
                                  Theme.of(context).textTheme.labelSmall,
                              title: "CVV:",
                              subTitle: "211",
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: 1,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
            child: Column(
              children: List.generate(
                  150 ~/ 5,
                  (index) => Expanded(
                        child: Container(
                          color:
                              index % 2 == 0 ? Colors.transparent : Colors.grey,
                          height: 1.0,
                        ),
                      )),
            ),
          ),

          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        TTexts.approved.tr,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.green),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    FittedBox(
                      child: VerticalTitleSubTitleWidget(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        titleStyle: Theme.of(context).textTheme.displayMedium,
                        subTitleStyle:
                            Theme.of(context).textTheme.displayMedium,
                        title: "${TTexts.dateOfAdded.tr}:",
                        subTitle: " 4 ${TTexts.monthsAgo.tr}",
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
