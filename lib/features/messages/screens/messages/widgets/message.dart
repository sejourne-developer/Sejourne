import 'package:sejourne/data/services/exporter.dart';
import '../../chat/chat_screen.dart';
import 'message_container.dart';

class Message extends StatelessWidget {
  const Message({
    super.key, required this.users,
  });
  final List<String> users;

  @override
  Widget build(BuildContext context) {

    List<String> users1 = [
      "Catalin Pustai",
      "Alice Johnson",
      "Bob Smith",
      "Charlie Brown",
      "David Williams",
      "Eve Davis",
      "Frank Miller",
      "Grace Wilson",
      "Heidi Moore",
      "Ivan Taylor",
      "Judy Anderson",
    ];
    return InkWell(
      onTap: () => Get.to(() => const ChatScreen()),
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxHeight: double.infinity, minHeight: 56),
        child: ListView.separated(
          itemCount: users.length,
          shrinkWrap: true,
          //physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsetsDirectional.only(
              start: TSizes.sm,
              end: TSizes.sm,
              top: TSizes.sm,
              bottom: TSizes.spaceBtwSections * 2),

          separatorBuilder: (_, index) => const SizedBox(
            height: TSizes.sm,
          ),
          itemBuilder: (_, index) =>
              MessageContainer(image: users[index], userName: users1[index],isPriority:index==0? true:false,),
        ),
      ),
    );
  }
}
