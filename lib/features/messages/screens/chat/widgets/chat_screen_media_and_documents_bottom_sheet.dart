import 'package:sejourne/common/widgets/images/rounded_image.dart';
import 'package:sejourne/common/widgets/layouts/grid_layout.dart';

import '../../../../../data/services/exporter.dart';

class ChatScreenMediaAndDocumentsBottomSheet extends StatelessWidget {
  const ChatScreenMediaAndDocumentsBottomSheet({super.key, required this.documents});
  final List<String> documents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all( TSizes.md),
      height: TDeviceUtils.getScreenHeight() * 0.8,
      child: SingleChildScrollView(
        child: TGridLayout(
          itemCount: documents.length,
          crossAxisCount: 2,
          mainAxisExtent: 160,
          itemBuilder: (_,index)=> TRoundedContainer(
            padding: EdgeInsets.zero,
            child: TRoundedImage(imageUrl: documents[index],margin: EdgeInsets.zero,),
          ),
        ),
      ),
    );
  }
}
