import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/common/widgets/texts/section_header.dart';

import '../../../../../data/services/exporter.dart';
import 'booking_property_details.dart';

class OngoingBookingTab extends StatelessWidget {
  const OngoingBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ongoing = [
      TImage.prop11,
      TImage.prop1,
      TImage.prop16,
      TImage.prop6,
      TImage.prop12,
    ];
    return RefreshIndicator(
      color: TColors.accent,
      backgroundColor: THelperFunctions.isDarkMode(context)?TColors.darkContainer:TColors.white,
      onRefresh: () => Future.delayed(
        const Duration(milliseconds: 500),
            () {
          debugPrint("ongoing booking tab");
        },
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(TSizes.sm),
          child: Column(
            children: [

               TSectionHeading(
                title: TTexts.ongoingStaysLabel.tr,
                showActionButton: false,
              ),

              const SizedBox(
                height: TSizes.md,
              ),
              ListLayout(
                  padding: EdgeInsets.zero,
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => BookingPropertyDetails(
                    bookingType: 1,
                        image: ongoing[index],
                        title: "Catalin PustaiCatalin PustaiCatalin Pustai",
                        status: TTexts.paidLabel.tr,
                        time: '30m ago',
                        location: '2BR (608) O2 Residence JLT',
                        checkInCheckOutDate: "17.06.2024 - 26.06.2024",
                        nights: "9",
                        price: '950',
                        cleaningFee: '650',
                        paidAmount: '48.400',
                      ),
                  itemCount: ongoing.length),
              SizedBox(
                height: TDeviceUtils.getBottomNavigationBarHeight() * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
