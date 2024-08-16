import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/bookings/screens/myBooking/widgets/all_booking_tab.dart';
import 'package:sejourne/features/bookings/screens/myBooking/widgets/completed_booking_tab.dart';
import 'package:sejourne/features/bookings/screens/myBooking/widgets/ongoing_booking_tab.dart';
import 'package:sejourne/features/bookings/screens/myBooking/widgets/upcoming_booking_tab.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';

import '../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../../../common/widgets/login_sing_up_widgets/you_must_login_first.dart';
import '../../controllers/booking_controller/booking_controller.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final token = TLocalStorage().readData("TOKEN");
    List<Widget> myTabs = <Widget>[
      Obx(
        () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra1.value,
          textStyle: controller.isGra1.value
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.allLabel.tr,
        ),
      ),
      Obx(
        () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra2.value,
          textStyle: controller.isGra2.value
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.completedLabel.tr,
        ),
      ),
      Obx(
        () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra3.value,
          textStyle: controller.isGra3.value
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.ongoingStaysLabel.tr,
        ),
      ),
      Obx(
        () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra4.value,
          textStyle: controller.isGra4.value
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.upcomingLabel.tr,
        ),
      ),
    ];
    List<Widget> tabsBody = [
      const AllBookingTab(),
      const CompletedBookingTab(),
      const OngoingBookingTab(),
      const UpcomingBookingTab(),
    ];
    return DefaultTabController(
      length: 4,
      child: BackgroundImageContainer(
        child:token !=null?  NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // SliverAppBar
              SliverAppBar(
                automaticallyImplyLeading: false,
                floating: false,
                actions: [Container()],
                flexibleSpace: const NetworkCheckerContainer(),
                title: MainScreensAppBar(
                    leadingIcon: TImage.bookingsIcon,
                    title: TTexts.myBookingsLabel.tr),
                bottom: TabBar(
                  labelPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.xs),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const BoxDecoration(color: Colors.transparent),
                  onTap: (val) => controller.tabBarButtonClicked(val),
                  tabs: myTabs,
                ),
              ),
            ];
          },
          body:TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: tabsBody,
          )
        ):  YouMustLoginFirst(
          appBarTitle: TTexts.myBookingsLabel.tr,
          appBarIcon: TImage.bookingsIcon,
        ),
      ),
    );
  }
}
