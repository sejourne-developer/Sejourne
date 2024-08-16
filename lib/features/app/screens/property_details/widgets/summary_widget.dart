import '../../../../../common/widgets/icons/vertical_icon_title_subtitle.dart';
import '../../../../../data/services/exporter.dart';

class Summary extends StatelessWidget {
  const Summary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> icons=[TImage.houseIcon,TImage.guests,TImage.bedRoomsIcon,TImage.bathIcon2];
    List<String> title=[TTexts.apartmentLabel.tr,TTexts.accommodationLabel.tr,'${TTexts.studioLabel.tr} ${TTexts.bedRoomLabel.tr}',TTexts.bathroomsLabel.tr];
    List<String> subTitle=[TTexts.studioLabel.tr,'2 ${TTexts.guestTitle.tr}','1 ${TTexts.bedRoomLabel.tr}','1 ${TTexts.fullLabel.tr}'];
    return  TRoundedContainer(
      isGradient: false,
      showBorder: true,
      borderColor: TColors.grey,
      child: Row(
        children: [
          /// Apartment Button
          for(int i=0;i<title.length;i++)
          Expanded(
            flex: 2,
            child: IconTitleSubTitle(
              icon: icons[i],
              title: title[i],
              subTitle: subTitle[i],
              showBorder: i!=title.length-1,
            ),
          ),
        ],
      ),
    );
  }
}


