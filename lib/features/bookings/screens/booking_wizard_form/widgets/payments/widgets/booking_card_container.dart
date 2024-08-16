import 'package:dotted_border/dotted_border.dart';

import '../../../../../../../common/widgets/texts/vertical_title_sub_title_widget.dart';
import '../../../../../../../data/services/exporter.dart';

class BookingCardContainer extends StatelessWidget {
  const BookingCardContainer({
    super.key,
    required this.cardName,
    required this.cardNum,
    required this.cardExpDate,
    required this.cardCvv,
    required this.index,
    required this.selectedIndex,
  });

  final String cardName, cardNum, cardExpDate, cardCvv;
  final int index, selectedIndex;

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
              child: selectedIndex == index
                  ? CircleAvatar(
                      backgroundColor: TColors.primary,
                      radius: 100,
                      child: Icon(
                        Icons.done,
                        size: TSizes.iconLg,
                        color: dark ? TColors.darkFontColor : TColors.white,
                      ),
                    )
                  : DottedBorder(
                      borderType: BorderType.Circle,
                      color:
                          dark ? TColors.grey2 : TColors.darkPrimaryBorderColor,
                      dashPattern: const [2, 2],
                      strokeWidth: 1,
                      borderPadding: const EdgeInsets.all(1),
                      child: const Center(
                        child: SizedBox(),
                      ),
                    ),
            ),
          ),

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
                  Text(cardName,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color:
                              dark ? TColors.darkFontColor : TColors.primary)),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  Text(cardNum,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium!),
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
                        subTitle: "01/12",
                      ),
                      const SizedBox(
                        width: TSizes.md,
                      ),
                      VerticalTitleSubTitleWidget(
                        titleStyle: Theme.of(context).textTheme.labelSmall,
                        subTitleStyle: Theme.of(context).textTheme.labelSmall,
                        title: "CVV:",
                        subTitle: "211",
                      ),
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
                    Text(
                      TTexts.approved.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.green),
                    ),
                    FittedBox(
                      child: VerticalTitleSubTitleWidget(
                        titleStyle: Theme.of(context).textTheme.labelSmall,
                        subTitleStyle: Theme.of(context).textTheme.labelSmall,
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
