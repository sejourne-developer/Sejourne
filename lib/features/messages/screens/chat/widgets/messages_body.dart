import 'package:dotted_border/dotted_border.dart';
import 'package:sejourne/data/services/exporter.dart';

import '../../../../../common/widgets/images/dotted_border_circle_image.dart';
import '../../../models/chat_model.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChatMessageModel> messages = [
      ChatMessageModel(messageContent: "Hello, Will", messageType: "receiver"),
      ChatMessageModel(
          messageContent: "How have you been?", messageType: "receiver"),
      ChatMessageModel(
          messageContent: "Hey Kriss, I am doing fine dude. wbu?",
          messageType: "sender"),
      ChatMessageModel(
          messageContent: "ehhhh, doing OK.", messageType: "receiver"),
      ChatMessageModel(
          messageContent: "Is there any thing wrong?", messageType: "sender"),
    ];

    /// messages for sender and receiver
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: messages[index].messageType == "receiver"
                ? receiverMessage(messages[index])
                : senderMessage(messages[index]));
      },
    );
  }
}

/// receiver messages
Widget receiverMessage(
  ChatMessageModel model,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const TDottedBorderCircleImage(
        isSvg: true,
        borderWidth: 1,
        image: TImage.user,
        imageSize: TSizes.iconLg,
        status: false,
      ),
      const SizedBox(
        width: TSizes.sm,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yesterday 7:14:58 AM",
            style: Theme.of(Get.context!).textTheme.labelSmall,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
          TRoundedContainer(
            isGradient: false,
            showBorder: true,
            radius: 100,
            shadow: TShadowStyle.containerShadow,
            padding: const EdgeInsets.all(TSizes.sm),
            child: Text(
              model.messageContent,
              style: Theme.of(Get.context!).textTheme.labelSmall,
            ),
          )
        ],
      ),
    ],
  );
}

/// sender messages
Widget senderMessage(ChatMessageModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Yesterday 7:14:58 AM",
            style: Theme.of(Get.context!).textTheme.labelSmall,
          ),
          const SizedBox(
            height: TSizes.sm,
          ),
          TRoundedContainer(
            isGradient: false,
            radius: 100,
            shadow: TShadowStyle.containerShadow,
            //padding: const EdgeInsets.all(1),
            child: TRoundedContainer(
              isGradient: false,
              radius: 100,
              showBorder: false,
              //padding: EdgeInsets.all(TSizes.sm),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(100),
                padding: const EdgeInsets.all(TSizes.sm),
                strokeWidth: 0.5,
                dashPattern: const [2, 2],
                child: Text(
                  model.messageContent,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .labelSmall!
                      .apply(color: TColors.darkGrey),
                ),
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        width: TSizes.sm,
      ),
      const TDottedBorderCircleImage(
        image: TImage.user,
        isSvg: true,
        borderWidth: 1,
        imageSize: TSizes.iconLg,
        status: false,
      ),
    ],
  );
}
