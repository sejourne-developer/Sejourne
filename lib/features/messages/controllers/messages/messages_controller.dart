import 'package:emoji_extension/emoji_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/text_strings.dart';


class MessagesController extends GetxController {
  static MessagesController get instance => Get.find();
  final Rx<List<String>> tagsList = Rx<List<String>>([]);
  TextEditingController tagsController=TextEditingController();
final itemCount=0.obs;

  @override
  void onInit() {
    super.onInit();
    addItem(TTexts.discount.tr);
    addItem(TTexts.maintenance.tr);
    addItem(TTexts.soon.tr);
  }


  @override
  void onReady() {

  }


  @override
  void onClose() {
    tagsController.dispose();
  }

  void addItem(String item) {
    tagsList.value.add(item);
    itemCount.value=tagsList.value.length;
    tagsController.clear();
  }
  void removeItem(int index) {
    tagsList.value.removeAt(index);
    itemCount.value=tagsList.value.length;
  }

  Rx<int> currentPageIndex = 0.obs;
  final isPriority = true.obs;
  final isGra1 = true.obs;
  final isGra2 = false.obs;
  final isGra3 = false.obs;
  final isGra4 = false.obs;
  final isGra5 = false.obs;
  final showEmojiContainer = false.obs;
  final showOnlineStatusBar = true.obs;
  final showAttachmentContainer = false.obs;
  final showChatBottomBar = true.obs;
  final enableTagDropDown = true.obs;
  final isExpanded=false.obs;
  final List<Emoji> emojis = Emojis.all;

  final messageTextEditController = TextEditingController();
  FocusNode messageTextEditControllerFocusNode = FocusNode();
  final scrollController = ScrollController();
  final tabBarCurrentIndex = 0.obs;
  Rx<double> onlineStatusBarCurrentHeight = 120.0.obs;
  Rx<double> chatSearchBarHeight = 0.0.obs;
  Rx<double> headerCurrentHeight = 276.0.obs;

  bool emojiShowing = false;

  /// Jump to the specific dot selected page
  void tabBarButtonClicked(index) {
    currentPageIndex.value = index;
    if (index == 0) {
      isGra1.value = true;
      isGra2.value = false;
      isGra3.value = false;
      isGra4.value = false;
      isGra5.value = false;
    } else if (index == 1) {
      isGra1.value = false;
      isGra2.value = true;
      isGra3.value = false;
      isGra4.value = false;
      isGra5.value = false;
    } else if (index == 2) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = true;
      isGra4.value = false;
      isGra5.value = false;
    } else if (index == 3) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = false;
      isGra4.value = true;
      isGra5.value = false;
    } else if (index == 4) {
      isGra1.value = false;
      isGra2.value = false;
      isGra3.value = false;
      isGra4.value = false;
      isGra5.value = true;
    }
  }

  void expandOnChanged() {
    onlineStatusBarCurrentHeight.value = showOnlineStatusBar.value ? 120 : 0;
    headerCurrentHeight.value = showOnlineStatusBar.value ? 276 : 276 - 120;
  }

}
