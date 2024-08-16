import 'package:animated_custom_dropdown/custom_dropdown.dart';

import '../../../../data/services/exporter.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    super.key,
    this.height = 56,
    this.iconSize = TSizes.iconMd,
    this.hintTextStyle, required this.items, this.onChanged, required this.hintText, required this.prefixIcon,
  });

  final String hintText,prefixIcon;
  final double height, iconSize;
  final TextStyle? hintTextStyle;
  final List<String> items;
  final dynamic Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
  final  dark=THelperFunctions.isDarkMode(context);
    return Center(
      child: CustomDropdown<String>.search(
        hintText: hintText,
        items: items,
        decoration: CustomDropdownDecoration(
            headerStyle: Theme.of(context).textTheme.labelMedium,
            hintStyle: Theme.of(context).textTheme.labelMedium,
            expandedSuffixIcon: SvgPicture.asset(
              TImage.clearIcon,
              height: TSizes.iconXs,
              width: TSizes.iconXs,
              colorFilter: ColorFilter.mode(
                  dark ? TColors.darkIconColor : TColors.lightIconColor,
                  BlendMode.srcIn),
            ),
            closedSuffixIcon: SvgPicture.asset(
              TImage.arrowDownIcon,
              height: TSizes.iconXs,
              width: TSizes.iconXs,
              colorFilter: ColorFilter.mode(
                  dark ? TColors.darkIconColor : TColors.lightIconColor,
                  BlendMode.srcIn),
            ),
            closedFillColor: dark ? TColors.dark : TColors.white,
            expandedFillColor: dark ? TColors.dark : TColors.white,
            searchFieldDecoration: SearchFieldDecoration(
                fillColor: dark ? TColors.dark : TColors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: dark
                            ? TColors.darkPrimaryBorderColor
                            : TColors.lightPrimaryBorderColor))),
            prefixIcon: SvgPicture.asset(
              prefixIcon,
              height: iconSize,
              width: iconSize,
              colorFilter: ColorFilter.mode(
                  dark ? TColors.darkIconColor : TColors.primary,
                  BlendMode.srcIn),
            ),
            closedBorder: Border.all(
                width: 1,
                color: dark
                    ? TColors.darkPrimaryBorderColor
                    : TColors.lightPrimaryBorderColor)),
        excludeSelected: false,
        onChanged: onChanged,
      ),
    );
  }
}
