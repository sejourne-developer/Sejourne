

import '../../../../../../common/widgets/layouts/list_layout.dart';
import '../../../../../../common/widgets/texts/section_header.dart';
import '../../../../../../data/services/exporter.dart';
import 'rating_progress_indicator.dart';
import 'user_review_card.dart';

class PropertyReviewsWidget extends StatelessWidget {
  const PropertyReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List usersImages = [
      TImage.user1,
      TImage.user2,
      TImage.user3,
      TImage.user4,
      TImage.user5,
      TImage.user3,
      TImage.user2,
      TImage.user4,
    ];
    List usersNames = [
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Section heading
        TSectionHeading(
          title: TTexts.overallRating.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Overall Product Ratings
        const OverallPropertyRating(
          rating: "4.8",
          reviews: "120",
          location: "4.5",
          cleanliness: "4.5",
          accuracy: "4.5",
          checkIn: "4.5",
          communication: "4.5",
          value: "4.5",
          apartmentLocation: "Studio (806) at Dubai Arch (JLT)",
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TSectionHeading(
          title: TTexts.guestsRating.tr,
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        /// User Reviews List
        ListLayout(
          itemCount: 3,
          padding: EdgeInsets.zero,
          itemBuilder: (_ , index ) =>  UserReviewsCard(
            userImage: usersImages[index],
            location: "4.5",
            cleanliness: "4.5",
            accuracy: "4.5",
            checkIn: "4.5",
            communication: "4.5",
            value: "4.5",
            userName: usersNames[index],
            reviewComment: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
            rating: 5,
          ),
        ),
      ],
    );
  }
}
