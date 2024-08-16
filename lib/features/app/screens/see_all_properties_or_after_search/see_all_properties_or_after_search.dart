import 'package:sejourne/common/widgets/custom_shapes/containers/property_container.dart';
import 'package:sejourne/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sejourne/features/app/controllers/drawers/drawer_controller.dart';
import 'package:sejourne/features/app/screens/property_details/property_details_screen.dart';
import 'package:sejourne/features/app/screens/see_all_properties_or_after_search/widgets/see_all_properties_or_after_search_app_bar.dart';
import 'package:sejourne/data/services/exporter.dart';
import '../drawers/home/home_screen_search_end_drawer_filter_menu.dart';

class SeeAllPropertiesOrAfterSearchScreen extends StatelessWidget {
  const SeeAllPropertiesOrAfterSearchScreen(
      {super.key, this.ignoreAppBar = false});

  final bool ignoreAppBar;

  @override
  Widget build(BuildContext context) {
    List<String> properties = [
      TImage.property,
      TImage.property1,
      TImage.property2,
      TImage.property3,
      TImage.property4,
      TImage.property5,
      TImage.property6,
    ];
    List<Rx<bool>> fav = [
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
      false.obs,
    ];
    return Scaffold(
      key: MyDrawerController.instance.searchScaffoldKey,
      resizeToAvoidBottomInset: false,
      endDrawer: Drawer(
        shape: InputBorder.none,
        width: TDeviceUtils.getScreenWidth(context) * 0.50,
        child: const HomeScreenSearchEndDrawerFilter(),
      ),
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const NetworkCheckerContainer(),

              /// App Bar
              ignoreAppBar
                  ? const SizedBox()
                  : const SeeAllPropertiesOrAfterSearchAppBar(),

               Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: TSearchContainer(
                  text: TTexts.searchLabel.tr,
                  isTextField: true,
                ),
              ),

              ignoreAppBar
                  ? const SizedBox()
                  :  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                      child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text("32 ${TTexts.resultsLabel.tr} ${TTexts.foundLabel.tr}")),
                    ),
              const SizedBox(
                height: TSizes.sm,
              ),

              /// Property list
              SizedBox(
                width: double.infinity,
                //height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: properties.length,
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsetsDirectional.only(end: TSizes.sm),
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () => Get.to(() =>  PropertyDetailScreen(
                        heroTag: "SeeAllPropertiesOrAfterSearchScreen$index",
                      )),
                      child: PropertyWidget(
                        isFav: fav[index],
                        propertyImage: properties[index],
                        index: index,
                        com: false.obs,
                        heroTag: "SeeAllPropertiesOrAfterSearchScreen$index",
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
