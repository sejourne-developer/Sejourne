import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/texts/horizontal_icon_text.dart';
import '../../../../../common/widgets/texts/section_header.dart';
import '../../../../../data/services/exporter.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> icons=[TImage.priceIcon,TImage.bathIcon2,TImage.hash,TImage.city,TImage.guests,TImage.guests,TImage.bedRoomsIcon];
    List<String> title=[TTexts.priceLabel.tr,TTexts.bathroomsLabel.tr,TTexts.iDLabel.tr,TTexts.typeLabel.tr,TTexts.guestTitle.tr,TTexts.allowAdditionalGuestsLabel.tr,TTexts.bedRoomLabel2.tr];
    List<String> subTitle=["350.00AED/${TTexts.nightLabel.tr}","1","5178","${TTexts.apartmentLabel.tr}, ${TTexts.studioLabel.tr}","2",TTexts.noLabel.tr,"1"];
    return Column(
      children: [
        /// Section heading
        TSectionHeading(
          title: TTexts.detailsLabel.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),

        /// property details
        TGridLayout(
          crossAxisCount: 2,
          mainAxisSpacing: TSizes.sm,
          crossAxisSpacing: TSizes.sm,
          mainAxisExtent: TSizes.md,
          itemCount: title.length,
          itemBuilder: (_, index) => Align(
            alignment: AlignmentDirectional.centerStart,
            child: FittedBox(
              child: HorizontalIconText(
                icon: icons[index],
                title: title[index],
                iconSize: TSizes.iconSm,
                subTitle: subTitle[index],
                titleTextStyle: Theme.of(context).textTheme.bodyLarge!.apply(color: THelperFunctions.isDarkMode(context)?TColors.darkFontColor:TColors.darkGrey),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
