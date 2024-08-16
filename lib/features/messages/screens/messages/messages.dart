import 'package:flutter/foundation.dart';
import 'package:sejourne/common/widgets/login_sing_up_widgets/you_must_login_first.dart';
import 'package:sejourne/data/services/exporter.dart';
import 'package:sejourne/features/messages/screens/messages/widgets/message.dart';
import 'package:sejourne/features/messages/screens/messages/widgets/message_search_bar.dart';
import 'package:sejourne/features/messages/screens/messages/widgets/online_frinds_status_bar.dart';
import 'package:sejourne/utils/local_storage/storage_utility.dart';

import '../../../../common/widgets/custom_shapes/containers/status_container.dart';
import '../../controllers/messages/messages_controller.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MessagesController());
    final token = TLocalStorage().readData("TOKEN");
    List users = [
      TImage.user1,
      TImage.user2,
      TImage.user3,
      TImage.user4,
      TImage.user5,
      TImage.user3,
      TImage.user2,
      TImage.user4,
    ];
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
          label: TTexts.openLabel.tr,
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
          label: TTexts.snoozedLabel.tr,
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
          label: TTexts.closedLabel.tr,
        ),
      ),
      Obx(
        () => StatusContainer(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.sm),
          isGradient: controller.isGra5.value,
          textStyle: controller.isGra5.value
              ? Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: Colors.white)
              : null,
          backgroundColor: Colors.white,
          label: TTexts.archivedLabel.tr,
        ),
      ),
    ];
    List<Widget> tabsBody = [
      const Message(
        users: [
          TImage.user6,
          TImage.user7,
          TImage.user8,
          TImage.user9,
          TImage.user10,
          TImage.user11,
          TImage.user1,
          TImage.user2,
          TImage.user3,
          TImage.user4,
          TImage.user5,
        ],
      ),
      const Message(users: [
        TImage.user6,
        TImage.user7,
        TImage.user8,
      ]),
      const Message(
        users: [
          TImage.user9,
          TImage.user10,
          TImage.user11,
        ],
      ),
      const Message(users: [
        TImage.user1,
        TImage.user2,
        TImage.user3,
      ]),
      const Message(
        users: [
          TImage.user4,
          TImage.user5,
        ],
      ),
    ];
    return DefaultTabController(
      length: 5,
      child: PopScope(
        onPopInvoked: (v) async {
          if (kDebugMode) {
            print("============ didPop = $factory");
          }
          controller.showOnlineStatusBar.value = true;
          controller.expandOnChanged();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: BackgroundImageContainer(
            child: token != null
                ? NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return [
                        // SliverAppBar
                        Obx(
                          () => SliverAppBar(
                            automaticallyImplyLeading: false,
                            expandedHeight:
                                controller.headerCurrentHeight.value,
                            pinned: false,
                            actions: [Container()],
                            flexibleSpace: FlexibleSpaceBar(
                              background: SingleChildScrollView(
                                child: Column(
                                  //mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const NetworkCheckerContainer(),

                                    /// App Bar
                                    Padding(
                                      padding: TSpacingStyle
                                          .paddingWithAppBarHeight2,
                                      child: MainScreensAppBar(
                                          leadingIcon: TImage.messagesIcon,
                                          title: TTexts.messagesLabel.tr),
                                    ),

                                    /// Online Friends Status Bar
                                    Obx(
                                      () => AnimatedContainer(
                                        alignment: Alignment.center,
                                        color: Colors.transparent,
                                        curve: Curves.easeInOutSine,
                                        duration:
                                            const Duration(milliseconds: 0),
                                        height: controller
                                            .onlineStatusBarCurrentHeight.value,
                                        child: ListView.separated(
                                            padding: const EdgeInsetsDirectional
                                                .only(start: TSizes.sm),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (_, index) =>
                                                OnlineFriendsStatusBar(
                                                    isFirst: index == 0,
                                                    image: users[index]),
                                            separatorBuilder: (_, index) =>
                                                const SizedBox(
                                                  width: TSizes.sm,
                                                ),
                                            itemCount: users.length),
                                      ),
                                    ),

                                    /// Search Bar
                                    MessageSearchBar(
                                      focusNode: MessagesController.instance
                                          .messageTextEditControllerFocusNode,
                                      onEditCompleted: () {
                                        controller.showOnlineStatusBar.value =
                                            true;
                                        controller.expandOnChanged();
                                        MessagesController.instance
                                            .messageTextEditControllerFocusNode
                                            .unfocus();
                                      },
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwItems,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            bottom: TabBar(
                              labelPadding:
                                  const EdgeInsetsDirectional.symmetric(
                                      horizontal: TSizes.xs),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: const BoxDecoration(
                                  color: Colors.transparent),
                              onTap: (val) =>
                                  controller.tabBarButtonClicked(val),
                              tabs: myTabs,
                            ),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: tabsBody,
                    ),
                  )
                : YouMustLoginFirst(
                    appBarIcon: TImage.messagesIcon,
                    appBarTitle: TTexts.messagesLabel.tr,
            ),
          ),
        ),
      ),
    );
  }
}
