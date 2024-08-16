import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/features/notifications/screens/notification/widget/notification_container.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../common/widgets/login_sing_up_widgets/you_must_login_first.dart';
import '../../../../data/services/app_variables.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/local_storage/storage_utility.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = TLocalStorage().readData("TOKEN");
    final List<String> titles = [
      "Feedback Request",
      "Check-Out Reminder",
      "Upcoming Stay Reminder",
      "Check-In Instructions",
      "Booking Confirmation",
      "Seasonal Greetings",
    ];
    final List<String> time = [
      "Yesterday 7:20:18 AM",
      "Yesterday 7:20:18 AM",
      "Yesterday 7:20:18 AM",
      "Yesterday 7:20:18 AM",
      "Yesterday 7:20:18 AM",
      "Yesterday 7:20:18 AM",
    ];
    final List<String> note = [
      "We value your feedback! Please take a moment to share your experience at 2BR 405 at Miska (Old Town). Your input helps us improve our services.",
      "We hope you enjoyed your stay at 2BR 405 at Miska (Old Town). This is a friendly reminder that your check-out time is at 11 AM on 16th May 2024. Safe travels!",
      "Reminder: Your stay at 2BR 405 at Miska (Old Town) is just 3 days away! We can't wait to welcome you. If you have any questions, feel free to contact us.",
      "Welcome to 2BR 405 at Miska (Old Town) Here are your check-in details: [Instructions]. Enjoy your stay!",
      "Your booking is confirmed! Thank you for choosing Sejourne. Your stay at 2BR 405 at Miska (Old Town) is scheduled from 14th May 2024 to 16th May 2024. We look forward to hosting you!",
      "Happy Holidays from Sejourne! Wishing you a wonderful season filled with joy and happiness. Book your next holiday with us for a special treat!",
    ];

    return Scaffold(
      body: BackgroundImageContainer(
          child: Column(
        children: [
          /// App bar
          TAppBar(
            leadingIcon:
                Get.locale == arabic ? TImage.rightArrowIcon : TImage.backArrow,
            title: Text(TTexts.notificationsTitle.tr),
          ),

          token != null
              ? ListLayout(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                  itemBuilder: (_, index) => NotificationContainer(
                    title: titles[index],
                    time: time[index],
                    note: note[index],
                  ),
                  separatorHeight: TSizes.md,
                  itemCount: titles.length,
                )
              : const YouMustLoginFirst(
                  ignoreAppBar: true,
                ),
        ],
      )),
    );
  }
}
