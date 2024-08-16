import 'package:flutter/material.dart';

import '../custom_shapes/containers/status_container.dart';
import 'dotted_rounded_border_title.dart';

class DottedCenterTitle extends StatelessWidget {
  const DottedCenterTitle({
    super.key,
    required this.title,
    this.borderColor,
    this.dottedRoundedBorderTitle = false,
  });

  final String title;
  final Color? borderColor;
  final bool dottedRoundedBorderTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 20,
        child: Row(
          children: List.generate(
            dottedRoundedBorderTitle ? 150 ~/ 0.9 : 150 ~/ 3,
            (index) => Expanded(
              child: Container(
                color: index % 2 == 0
                    ? Colors.transparent
                    : borderColor ?? Colors.grey,
                height: dottedRoundedBorderTitle ? 0.5 : 1.0,
              ),
            ),
          ),
        ),
      ),
      dottedRoundedBorderTitle
          ? Align(
              alignment: AlignmentDirectional.center,
              child: DottedRoundedBorderTitle(
                title: title,
              ),
            )
          : Align(
              alignment: AlignmentDirectional.center,
              child: StatusContainer(label: title),
            ),
    ]);
  }
}
