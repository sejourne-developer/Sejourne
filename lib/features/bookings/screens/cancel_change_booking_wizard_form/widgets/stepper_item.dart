import 'package:flutter/material.dart';
import 'package:sejourne/utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class StepperItem extends StatelessWidget {
  final String title;
  final int index;
  final int currentIndex;
  final bool isLast;

  const StepperItem(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.isLast,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return isLast
        ? Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: TSizes.md),
                    width: TSizes.lg,
                    height: TSizes.lg,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: currentIndex >= index
                              ? TColors.primary
                              : dark
                                  ? TColors.grey2
                                  : TColors.grey,
                        ),
                        color: index == currentIndex
                            ? TColors.primary
                            : dark
                                ? TColors.blackContainer
                                : TColors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  FittedBox(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  )
                ],
              ),
            ],
          )
        : Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsetsDirectional.only(top: TSizes.md),
                      width: TSizes.lg,
                      height: TSizes.lg,
                      //padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: currentIndex > index
                                ? TColors.primary
                                : dark
                                    ? TColors.grey2
                                    : TColors.grey,
                          ),
                          color: index == currentIndex
                              ? TColors.primary
                              : dark
                                  ? TColors.blackContainer
                                  : TColors.grey,
                          borderRadius: BorderRadius.circular(100)),
                      child: currentIndex > index
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: TColors.primary),
                            )
                          : Container(),
                    ),
                    const SizedBox(
                      height: TSizes.xs,
                    ),
                    FittedBox(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: currentIndex >= index + 1
                        ? List.generate(
                            90 ~/ 5,
                            (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    : TColors.primary,
                                height: 0.8,
                              ),
                            ),
                          )
                        : List.generate(
                            90 ~/ 5,
                            (index) => Expanded(
                              child: Container(
                                color: index % 2 == 0
                                    ? Colors.transparent
                                    // : dark
                                    // ? TColors.primary
                                    : TColors.darkGrey,
                                height: 0.8,
                              ),
                            ),
                          ),
                  ),
                )
              ],
            ),
          );
  }
}
