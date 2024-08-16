import 'package:sejourne/data/services/exporter.dart';
import '../../../../../common/widgets/custom_shapes/dropDown/custom_drop_down_field.dart';
import '../../../controllers/search/search_controller.dart';

class DropDownLocationField extends StatelessWidget {
  const DropDownLocationField({
    super.key,
    this.height = 56,
    this.iconSize = TSizes.iconMd,
    this.hintTextStyle,
  });

  final double height, iconSize;
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    final controller = SSearchController.instance;
    List<String> label = [
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
      TTexts.businessBayLabel,
      TTexts.downTownLabel,
      TTexts.dubaiHillsLabel,
      TTexts.dubaiMarinaLabel,
      TTexts.laCoteLabel,
    ];
    return Center(
      child: CustomDropDownField(
        hintText: "${TTexts.select.tr} ${TTexts.locationLabel.tr}",
        prefixIcon: TImage.locationIcon,
        items: label,
        onChanged:(value){
              controller.selectedValue = value;
              debugPrint('changing value to: $value');
        } ,
      ),
      // child: CustomDropdown<String>.search(
      //   hintText:"${TTexts.select.tr} ${TTexts.locationLabel.tr}",
      //   items: label,
      //   decoration: CustomDropdownDecoration(
      //     headerStyle: Theme.of(context).textTheme.labelMedium,
      //     hintStyle: Theme.of(context).textTheme.labelMedium,
      //       expandedSuffixIcon: SvgPicture.asset(
      //         TImage.clearIcon,
      //         height: TSizes.iconXs,
      //         width: TSizes.iconXs,
      //         colorFilter: ColorFilter.mode(
      //             dark ? TColors.darkIconColor : TColors.lightIconColor,
      //             BlendMode.srcIn),
      //       ),
      //       closedSuffixIcon: SvgPicture.asset(
      //         TImage.arrowDownIcon,
      //         height: TSizes.iconXs,
      //         width: TSizes.iconXs,
      //         colorFilter: ColorFilter.mode(
      //             dark ? TColors.darkIconColor : TColors.lightIconColor,
      //             BlendMode.srcIn),
      //       ),
      //       closedFillColor: dark ? TColors.dark : TColors.white,
      //       expandedFillColor: dark ? TColors.dark : TColors.white,
      //       searchFieldDecoration: SearchFieldDecoration(
      //           fillColor: dark ? TColors.dark : TColors.white,
      //           border: OutlineInputBorder(
      //               borderSide: BorderSide(
      //                   color: dark
      //                       ? TColors.darkPrimaryBorderColor
      //                       : TColors.lightPrimaryBorderColor))),
      //       prefixIcon: SvgPicture.asset(
      //         TImage.locationIcon,
      //         height: iconSize,
      //         width: iconSize,
      //         colorFilter: ColorFilter.mode(
      //             dark ? TColors.darkIconColor : TColors.primary,
      //             BlendMode.srcIn),
      //       ),
      //       closedBorder: Border.all(
      //           width: 1,
      //           color: dark
      //               ? TColors.darkPrimaryBorderColor
      //               : TColors.lightPrimaryBorderColor)),
      //   excludeSelected: false,
      //   onChanged: (value) {
      //     controller.selectedValue = value;
      //     debugPrint('changing value to: $value');
      //   },
      // ),
    );
  }
}
