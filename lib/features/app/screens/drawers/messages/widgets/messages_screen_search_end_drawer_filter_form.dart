import 'package:sejourne/common/widgets/layouts/grid_layout.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../../../common/widgets/texts/dotted_center_title.dart';
import '../../../../../../common/widgets/texts/horizontal_check_box_text.dart';
import '../../../../controllers/drawers/drawer_controller.dart';

class MessagesScreenSearchEndDrawerFilterForm extends StatelessWidget {
  const MessagesScreenSearchEndDrawerFilterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MyDrawerController.instance;

    List<String> priority = ["Priority First", "Newest", "Oldest"];
    List<Rx<bool>> priorityCheckBoxValue = [
      controller.priorityCheckBox,
      controller.newestCheckBox,
      controller.oldestCheckBox,
    ];
    List<String> type = ["Open", "Snoozed", "Closed", "Archived", "Close", ];
    List<Rx<bool>> typeCheckBoxValue = [
      controller.openCheckBox,
      controller.snoozedCheckBox,
      controller.closedCheckBox,
      controller.archivedCheckBox,
      controller.closeCheckBox,
    ];

    List<String> booking = ["Support", "Accepted", "Cancelled", "Inquiry","Pending"];
    List<Rx<bool>> bookingCheckBoxValue = [
      controller.supportCheckBox,
      controller.acceptedCheckBox,
      controller.canceledCheckBox,
      controller.inquiryCheckBox,
      controller.pendingCheckBox,
    ];

    ///  Date
    return Form(
      key: controller.filterBookingsFormKey,
      child: Column(
        children: [

          ///============================================ Priority section =====================================================///
          const DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: "Priority",
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
            crossAxisCount: 2,
            mainAxisExtent: TSizes.lg,
            itemCount: priority.length,
            itemBuilder: (_, index) => Obx(
              () => GestureDetector(
                onTap: () => priorityCheckBoxValue[index].value =
                !priorityCheckBoxValue[index].value,
                child: HorizontalCheckBoxText(
                    value: priorityCheckBoxValue[index].value,
                    title: priority[index],
                    onChanged: (value) => priorityCheckBoxValue[index].value =
                        !priorityCheckBoxValue[index].value),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///============================================ Type section =====================================================///
          const DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: "Type",
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
            crossAxisCount: 2,
            mainAxisExtent: TSizes.lg,
            itemCount: type.length,
            itemBuilder: (_, index) => Obx(
              () => GestureDetector(
                onTap: () => typeCheckBoxValue[index].value =
                !typeCheckBoxValue[index].value,
                child: HorizontalCheckBoxText(
                  value: typeCheckBoxValue[index].value,
                  title: type[index],
                  onChanged: (value) => typeCheckBoxValue[index].value =
                      !typeCheckBoxValue[index].value,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///=============================================== Booking section ==================================================///
          const DottedCenterTitle(
            dottedRoundedBorderTitle: true,
            title: "Booking",
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          TGridLayout(
            crossAxisCount: 2,
            mainAxisExtent: TSizes.lg,
            itemCount: booking.length,
            itemBuilder: (_, index) => Obx(
              () => GestureDetector(
                onTap: ()=>bookingCheckBoxValue[index].value =
                !bookingCheckBoxValue[index].value,
                child: HorizontalCheckBoxText(
                    value: bookingCheckBoxValue[index].value,
                    title: booking[index],
                    onChanged: (value) => bookingCheckBoxValue[index].value =
                        !bookingCheckBoxValue[index].value),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),



        ],
      ),
    );
  }
}
