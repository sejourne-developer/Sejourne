import 'package:sejourne/common/widgets/buttons/primary_button.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/drawers_background_container.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/app/screens/drawers/home/widgets/home_screen_search_end_drawer_filter_booking_form.dart';
import '../../search/widgets/drop_down_location_field.dart';
import '../../see_all_properties_or_after_search/see_all_properties_or_after_search.dart';

class HomeScreenSearchEndDrawerFilter extends StatelessWidget {
  const HomeScreenSearchEndDrawerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawersBackgroundContainer(
      child: Column(
        children: [
          /// Location Drop down Field
          DropDownLocationField(
            height: 48,
            iconSize: TSizes.iconXs,
            hintTextStyle: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputField,
          ),

          /// Booking Form
          const HomeScreenSearchEndDrawerFilterBookingForm(),

          /// Filter Button
          PrimaryButton(
            loading: false.obs,
            title: "${TTexts.filterLabel.tr} ${TTexts.nowLabel.tr}",
            height: TSizes.defaultSpace * 1.5,
            onPressed: () => Get.to(
                    () => const SeeAllPropertiesOrAfterSearchScreen()),
          ),
        ],
      ),
    );
  }
}
