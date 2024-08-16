import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/compare/widget/compared_property.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> items = [
      TImage.property3,
      TImage.property5,
      TImage.property1,
      TImage.property6,
      TImage.property2,
    ];
    return Scaffold(
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NetworkCheckerContainer(),

              /// AppBar
               TAppBar(
                title: Text(TTexts.compareLabel.tr),
                leadingIcon:Get.locale==arabic? TImage.rightArrowIcon:TImage.backArrow,
              ),

              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: TGridLayout(
                    crossAxisSpacing: TSizes.sm,
                    mainAxisSpacing: TSizes.sm,
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    itemCount: 4,
                    itemBuilder: (_, index) => ComparedProperty(
                          imageUrl: items[index],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
