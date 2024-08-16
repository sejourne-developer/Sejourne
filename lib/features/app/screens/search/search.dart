import 'package:sejourne/common/widgets/appbar/appbar.dart';
import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/search/widgets/bookings_date_form.dart';
import 'package:sejourne/features/app/screens/search/widgets/drop_down_location_field.dart';
import 'package:sejourne/features/app/screens/search/widgets/search_app_bar.dart';
import '../../../../common/widgets/texts/horizontal_title_sub_title_widget.dart';
import '../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class SearchBottomSheetScreen extends StatelessWidget {
  const SearchBottomSheetScreen({super.key, this.drawerMenu = false});

  final bool drawerMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.sm,
          ),
          child: Column(
            children: [
              drawerMenu? const SizedBox(
                height: TSizes.spaceBtwSections,
              ):const SizedBox(),

              /// App bar
              drawerMenu? TAppBar(
                title: Text(TTexts.searchLabel.tr),
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
              ): const SearchAppBar(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// title subTitle Widget
               HorizontalTitleSubTitleWidget(
                title: TTexts.searchBottomSheetTitle.tr,
                subTitle: TTexts.searchBottomSheetSubTitle.tr,
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),

              /// Location Drop down Field
              const DropDownLocationField(),
              const SizedBox(
                height: TSizes.spaceBtwInputField,
              ),

              /// Booking Form
              const BookingsDateForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              PrimaryButton(
                loading: false.obs,
                  onPressed: () {
                    Get.back();
                    Get.to(() => const SeeAllPropertiesOrAfterSearchScreen());
                  },
                title:  "${TTexts.searchLabel.tr} ${TTexts.nowLabel.tr}",
                ),

              drawerMenu? const SizedBox(
                height: TSizes.spaceBtwSections,
              ):const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}
