import 'package:flutter/material.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/device/device_utility.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            )),
        Expanded(
          flex: 8,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.25,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 5,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(TSizes.sm),
              valueColor: const AlwaysStoppedAnimation(TColors.green),
            ),
          ),
        ),
      ],
    );
  }
}
