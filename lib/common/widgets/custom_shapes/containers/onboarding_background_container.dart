import 'package:sejourne/data/services/exporter.dart';
import '../curved_edges/curved_edges_widget.dart';

class OnBoardingBackgroundContainer extends StatelessWidget {
  const OnBoardingBackgroundContainer({
    super.key,
    this.child,
    this.radius = 0,
    this.height,
  });

  final Widget? child;
  final double radius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        decoration: BoxDecoration(
          gradient: THelperFunctions.isDarkMode(context)
              ? TColors.darkLinerGradient2
              : TColors.linerGradient2,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),

        width: double.infinity,
        height: height ?? (TDeviceUtils.getScreenHeight() * 0.68),

        /// -- if size.infinite is not true error occurred
        child: Stack(
          children: [
            child!,
          ],
        ),
      ),
    );
  }
}
