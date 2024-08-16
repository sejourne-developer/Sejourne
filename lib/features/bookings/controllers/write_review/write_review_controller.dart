import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/features/personalization/screens/reviews/reviews_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/popups/general_popups/primary_popup_container.dart';

class WriteReviewController extends GetxController {
  static WriteReviewController get instance => Get.find();

  /// Variables
  final pageController =
      PageController(); // write reviews pages Page controller
  Rx<int> currentPageIndex = 0.obs;

  final TextEditingController cleanlinessEditingController =
      TextEditingController();
  final TextEditingController comfortEditingController =
      TextEditingController();
  final TextEditingController checkInEditingController =
      TextEditingController();
  final TextEditingController locationEditingController =
      TextEditingController();
  final TextEditingController communicationEditingController =
      TextEditingController();
  final TextEditingController moneyValueEditingController =
      TextEditingController();
  final Rx<double> cleanlinessRating = 3.0.obs;
  final Rx<double> comfortRating = 3.0.obs;
  final Rx<double> checkInRating = 3.0.obs;
  final Rx<double> locationRating = 3.0.obs;
  final Rx<double> communicationRating = 3.0.obs;
  final Rx<double> moneyValueRating = 3.0.obs;
  final Rx<String> cleanlinessRatingText = "".obs;
  final Rx<String> comfortRatingText = "".obs;
  final Rx<String> checkInRatingText = "".obs;
  final Rx<String> locationRatingText = "".obs;
  final Rx<String> communicationRatingText = "".obs;
  final Rx<String> moneyValueRatingText = "".obs;
  final Rx<bool> imagePath = false.obs;
  final images = [].obs;
  final cleanlinessRatingImages = List.empty().obs;
  final comfortRatingImages = [].obs;
  final checkInRatingImages = [].obs;
  final locationRatingImages = [].obs;
  final communicationRatingImages = [].obs;
  final moneyValueRatingImages = [].obs;


  GlobalKey<FormState> cleanlinessReviewFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> comfortReviewFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> checkInReviewFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> locationReviewFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> communicationReviewFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> moneyValueReviewFormKey = GlobalKey<FormState>();



  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Update Current Index & Jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 5) {
      currentPageIndex.value = 0;
      showDialog(
        context: Get.context!,
        builder: (context) => PrimaryPopupContainer(
          headIcon: TImage.successIcon,
          title: TTexts.thanksLabel.tr,
          subTitle: TTexts.haveGoodTime.tr,
          buttonText: TTexts.backToHome.tr,
          showCancelButton: false,
          onPressed: () {
            dispose();
            Get.off(() => const ReviewsScreen());
          },
        ),
      );
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  /// Update Current Index & Jump to the next page
  void backPage() {
    int page = currentPageIndex.value - 1;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
  @override
  void dispose() {
    cleanlinessEditingController.clear();
    comfortEditingController.clear();
    checkInEditingController.clear();
    locationEditingController.clear();
    communicationEditingController.clear();
    moneyValueEditingController.clear();
    super.dispose();
  }
}
