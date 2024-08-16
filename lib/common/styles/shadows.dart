import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color:TColors.black.withOpacity(0.2),
    blurRadius: 10,
    spreadRadius: 5,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacity(0.1),
    blurRadius: 10,
    spreadRadius: 5,
    offset: const Offset(0, 0),
  );

  static final containerShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 4),
  );
}
