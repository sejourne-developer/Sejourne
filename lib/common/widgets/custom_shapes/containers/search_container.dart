import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/validators/validation.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.sm),
    this.isTextField = false,
    this.searchController,
    this.onEditingComplete, this.onPressedSearchSuffixButton,  this.showSearchSuffixButton=false,  this.suffixButtonText,
  });

  final String text;
  final String? suffixButtonText;
  final IconData? icon;
  final bool showBackground, showBorder, isTextField,showSearchSuffixButton;
  final VoidCallback? onTap, onEditingComplete,onPressedSearchSuffixButton;
  final EdgeInsetsGeometry padding;
  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return isTextField
        ? TextFormField(
            controller: searchController,
            expands: false,
            decoration: InputDecoration(
                hintText: text,
                prefixIcon: Icon(
                  icon,
                  color: dark ? TColors.darkIconColor : TColors.primary,
                ),
                contentPadding: EdgeInsets.zero,

                suffixIcon:showSearchSuffixButton? TRoundedContainer(
                  isGradient: true,
                  showBorder: false,
                  onPressed: onPressedSearchSuffixButton,
                  radius: TSizes.sm,
                  margin: const EdgeInsetsDirectional.all(
                      TSizes.sm),
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.md, vertical: TSizes.sm),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Center(
                      child: Text(
                       suffixButtonText ?? TTexts.searchLabel.tr ,
                        style: Theme.of(context).textTheme.labelMedium!.apply(
                            color: dark ? TColors.darkFontColor : TColors.white),
                      ),
                    ),
                  ),
                ):const SizedBox()
            ),
            onEditingComplete: onEditingComplete,
            validator: (value) => TValidator.validateEmptyText(text, value!),
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              width: TDeviceUtils.getScreenWidth(context),
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: showBackground
                    ? dark
                        ? TColors.blackContainer
                        : TColors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(TSizes.sm),
                border: showBorder
                    ? Border.all(
                        color: dark
                            ? TColors.darkPrimaryBorderColor
                            : TColors.grey)
                    : null,
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: dark ? TColors.darkIconColor : TColors.primary,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          );
  }
}
