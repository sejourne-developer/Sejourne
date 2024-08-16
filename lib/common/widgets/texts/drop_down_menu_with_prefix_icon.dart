import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'horizontal_icon_text.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';

class DropDownButtonWithPrefixIcon extends StatelessWidget {
  const DropDownButtonWithPrefixIcon({
    super.key,
    required TextEditingController controller,
    required this.items,
    required this.title,
    required this.prefixIcon,
    this.iconSize = TSizes.sm,
    this.textStyle,
    required this.suffixIcon,
  }) : _controller = controller;

  final TextEditingController _controller;
  final List<String> items;
  final String title, prefixIcon, suffixIcon;
  final double iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return PopupMenuButton<String>(
      icon: TRoundedContainer(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.sm, horizontal: TSizes.sm),
          radius: TSizes.xs,
          child: Row(
            children: [
              Flexible(
                  flex: 9,
                  child: HorizontalIconText(
                    maxLine: 1,
                    icon: suffixIcon,
                    title: title,
                    isSub: false,
                    iconSize: iconSize,
                    titleTextStyle:
                        textStyle ?? Theme.of(context).textTheme.displaySmall,
                  )),

              Flexible(
                  flex: 1,
                  child: SvgPicture.asset(
                    prefixIcon,
                    height: TSizes.iconSm,
                    colorFilter: ColorFilter.mode(
                        dark ? TColors.darkIconColor : TColors.primary,
                        BlendMode.srcIn),
                  )),
            ],
          )),
      onSelected: (String value) {
        _controller.text = value;
      },
      itemBuilder: (BuildContext context) {
        return items.map<PopupMenuItem<String>>((String value) {
          return PopupMenuItem(value: value, child: Text(value));
        }).toList();
      },
    );
  }
}
