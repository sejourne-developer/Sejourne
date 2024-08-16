import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ChargeDetailsTableRow extends StatelessWidget {
  const ChargeDetailsTableRow({
    super.key,
    required this.column1,
    required this.column2,
    required this.column3,
    required this.column4,
    required this.column5,
    this.isFirst = false,
    this.isLast = false,
  });

  final String column1, column2, column3, column4, column5;
  final bool isFirst, isLast;

  get dark => THelperFunctions.isDarkMode(Get.context!);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                flex: 2,
                child: Text(
                  column1,
                  style: isFirst
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? TColors.darkFontColor : TColors.primary)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.grey2),
                )),
            Flexible(
                flex: 2,
                child: Text(
                  column2,
                  style: isFirst
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? TColors.darkFontColor : TColors.primary)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.grey2),
                )),
            Flexible(
                flex: 2,
                child: Text(
                  column3,
                  style: isFirst
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? TColors.darkFontColor : TColors.primary)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.grey2),
                )),
            Flexible(
                flex: 2,
                child: Text(
                  column4,
                  style: isFirst
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? TColors.darkFontColor : TColors.primary)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.grey2),
                )),
            Flexible(
                flex: 2,
                child: Text(
                  column5,
                  style: isFirst
                      ? Theme.of(context).textTheme.labelMedium!.apply(
                          color: dark ? TColors.darkFontColor : TColors.primary)
                      : Theme.of(context).textTheme.labelSmall!.apply(
                          color: dark ? TColors.darkFontColor : TColors.grey2),
                )),
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        isLast
            ? const SizedBox()
            : SizedBox(
                //height: 20,
                child: Row(
                  children: List.generate(
                    400 ~/ 3,
                    (index) => Expanded(
                      child: Container(
                        color: index % 2 == 0
                            ? Colors.transparent
                            : isFirst
                                ? TColors.primary
                                : Colors.grey,
                        height: isFirst ? 1.0 : 0.5,
                      ),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
