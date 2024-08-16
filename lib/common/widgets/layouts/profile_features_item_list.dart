import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/services/exporter.dart';
import '../texts/horizontal_icon_text.dart';
import '../texts/horizontal_title_sub_title_widget.dart';

class ProfileFeaturesItemList extends StatelessWidget {
  const ProfileFeaturesItemList({
    super.key,
    required this.title,
    required this.subTitle,
    this.isVerified = false,
    this.onPressed,
    this.icon = TImage.emailIcon,
    this.description,
    this.showEditButton = true,
    this.showSwitchButton = false,
    this.switchButtonValue,
    this.permissionKey,
    this.permission,
    this.isPhoneNumber = false,
    this.isPermission = true, this.margin=const EdgeInsetsDirectional.only(bottom: TSizes.md),
  });

  final String title, subTitle, icon;
  final String? description, permissionKey;
  final bool isVerified, showEditButton, showSwitchButton;
  final VoidCallback? onPressed;
  final Rx<bool>? switchButtonValue;
  final Permission? permission;
  final bool isPhoneNumber, isPermission;
  final EdgeInsetsGeometry? margin;

  //final bool ver
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      shadow: TShadowStyle.containerShadow,
      radius: TSizes.sm + 2,
      padding: const EdgeInsetsDirectional.all(TSizes.md),
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    borderRadius: const BorderRadiusDirectional.all(
                        Radius.circular(TSizes.sm + 2)),
                    color: Get.isDarkMode
                        ? TColors.darkContainer
                        : const Color(0xFFF6F6F6),
                    child: Padding(
                        padding: const EdgeInsetsDirectional.all(TSizes.sm),
                        child: SizedBox(
                            width: TSizes.iconLg,
                            height: TSizes.iconLg,
                            child: Center(
                                child: SvgPicture.asset(icon,
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Get.isDarkMode
                                            ? TColors.darkIconColor
                                            : TColors.primary,
                                        BlendMode.srcIn))))),
                  ),
                  const SizedBox(
                    width: TSizes.sm,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 56,
                        maxWidth: showEditButton || showSwitchButton
                            ? TDeviceUtils.getScreenWidth(context) * 0.45
                            : TDeviceUtils.getScreenWidth(context) * 0.6),
                    child: HorizontalTitleSubTitleWidget(
                      title: title,
                      subTitle: subTitle,
                      isPhoneNumber: isPhoneNumber,
                      subTitleAlign: TextAlign.start,
                      titleStyle: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: Get.isDarkMode
                              ? TColors.darkFontColor
                              : TColors.black),
                      subTitleStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(
                              color: Get.isDarkMode
                                  ? TColors.darkFontColor
                                  : TColors.black.withOpacity(0.8)),
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  const SizedBox(
                    width: TSizes.sm,
                  ),
                  isVerified
                      ? Container(
                          width: 48,
                          margin:
                              const EdgeInsetsDirectional.only(top: TSizes.xs),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: HorizontalIconText(
                              mainAxisAlignment: MainAxisAlignment.center,
                              icon: TImage.verifiedIcon,
                              iconColor: TColors.green,
                              title: TTexts.verified.tr,
                              isSub: false,
                              titleTextStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: Get.isDarkMode
                                          ? TColors.darkFontColor
                                          : TColors.green),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),

              showEditButton
                  ? IconButton(
                      onPressed: onPressed,
                      icon: HorizontalIconText(
                        iconColor:
                            Get.isDarkMode ? TColors.darkIconColor : Colors.red,
                        icon: TImage.editIcon,
                        isSub: false,
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .apply(
                                color: Get.isDarkMode
                                    ? TColors.darkIconColor
                                    : Colors.red),
                        title: TTexts.change.tr,
                      ))
                  : showSwitchButton
                      ? Obx(
                          () => CupertinoSwitch(
                              value: switchButtonValue!.value,
                              onChanged: (value) async {
                                if (isPermission) {
                                  if (value) {
                                    final status = await THelperFunctions
                                        .requestPermission(
                                            permission: permission!);
                                    if (status.isGranted) {
                                      switchButtonValue!.value = value;
                                    } else {
                                      switchButtonValue!.value = false;
                                    }
                                  } else {
                                    await openAppSettings();
                                    if (permission?.status.isGranted != null) {
                                      switchButtonValue!.value = true;
                                    } else {
                                      switchButtonValue!.value = false;
                                    }
                                  }
                                } else {
                                  switchButtonValue!.value = value;
                                }
                              }),
                        )
                      : const SizedBox(),
            ],
          ),

          description != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: TSizes.appBarHeight),
                  //width: TDeviceUtils.getScreenWidth(context)*0.58,
                  // height: 56,
                  child: Text(description!,
                      //overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: Get.isDarkMode
                              ? TColors.darkFontColor
                              : TColors.grey2)),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
