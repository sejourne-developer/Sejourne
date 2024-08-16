import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HorizontalCheckBoxText extends StatelessWidget {
  const HorizontalCheckBoxText({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  final bool value;
  final void Function(bool?) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: TSizes.md,
          height: TSizes.md,
          child: Checkbox(
            side: BorderSide(
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.darkPrimaryBorderColor
                    : TColors.lightPrimaryBorderColor),
            value: value,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
