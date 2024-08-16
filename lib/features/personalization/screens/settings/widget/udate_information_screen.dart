import 'package:sejourne/common/widgets/appbar/appbar.dart';

import '../../../../../data/services/exporter.dart';

class UpdateInformationScreen extends StatelessWidget {
  const UpdateInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BackgroundImageContainer(child: Column(
        children: [
          TAppBar(
            title: Text(TTexts.updateInformationTitle.tr),
            leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
          ),
        ],
      )),
    );
  }
}
