import '../../../data/services/exporter.dart';
import 'stepper_item.dart';

class StepperLayout extends StatelessWidget {
  const StepperLayout(
      {super.key,
      required this.titles,
      required this.currentIndex,
      this.padding});

  final List<String> titles;
  final Rx<int> currentIndex;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding ?? EdgeInsets.symmetric(
          horizontal: TDeviceUtils.getScreenWidth(context) * 0.15,
          vertical: TSizes.md),
      child: Obx(
        () => Row(
          children: [
            for (int i = 0; i < titles.length; i++)
              StepperItem(
                title: titles[i],
                index: i,
                currentIndex: currentIndex.value,
                isLast: i == titles.length - 1,
              ),
            // StepperItem(
            //   title: TTexts.paymentLabel.tr,
            //   index: 1,
            //   currentIndex: controller.currentPageIndex.value,
            //   isLast: false,
            // ),
            // StepperItem(
            //   title: TTexts.addressLabel.tr,
            //   index: 2,
            //   currentIndex: controller.currentPageIndex.value,
            //   isLast: false,
            // ),
            // StepperItem(
            //   title: TTexts.thanksLabel.tr,
            //   index: 3,
            //   currentIndex: controller.currentPageIndex.value,
            //   isLast: true,
            // ),
          ],
        ),
      ),
    );
  }
}
