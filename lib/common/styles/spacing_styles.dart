import 'package:flutter/material.dart';
import 'package:sejourne/utils/device/device_utility.dart';

import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );

  static EdgeInsetsGeometry paddingWithAppBarHeight2 = EdgeInsets.only(
    top: TDeviceUtils.getAppBarHeight(),
    left: TSizes.sm,
    bottom: TSizes.sm,
    right: TSizes.sm,
  );
}
