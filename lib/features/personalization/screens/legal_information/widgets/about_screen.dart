import 'package:sejourne/common/widgets/appbar/appbar.dart';

import '../../../../../data/services/exporter.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BackgroundImageContainer(child: Padding(
        padding: const EdgeInsets.all(TSizes.sm),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               TAppBar(
                title: Text(TTexts.aboutLabel.tr),
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
              ),
              const SizedBox(height: TSizes.md,),
              Text(
                'Welcome to Sejourne Holiday Homes!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.md),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  '\tAt Sejourne, we believe that your holidays should be as unique and memorable as you are. Whether you\'re looking for a cozy cottage in the mountains, a luxurious villa by the sea, or a chic city apartment, Sejourne Holiday Homes has the perfect place for you.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Text(
                'Our Mission',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  '\tOur mission is to provide our guests with exceptional holiday experiences by offering a diverse range of high-quality accommodations, outstanding customer service, and a seamless booking process. We strive to create a platform where travelers can find their ideal holiday home effortlessly and with confidence.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Text(
                'What We Offer',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Wide Selection: Explore a wide variety of holiday homes, from beachfront villas and mountain retreats to urban apartments and countryside cottages. Our extensive range ensures that you find the perfect accommodation to suit your preferences and budget.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Verified Listings: Each property listed on Sejourne Holiday Homes is verified for quality and authenticity. We work closely with property owners to ensure that our listings meet the highest standards of comfort and safety.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Easy Booking: Our user-friendly app makes it simple to find, book, and manage your holiday home reservations. With just a few taps, you can secure your dream getaway and focus on enjoying your vacation.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  '24/7 Support: Our dedicated customer support team is available around the clock to assist you with any queries or issues. Whether you need help with your booking or have questions about your destination, we\'re here to help.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Text(
                'Why Choose Sejourne?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Trusted by Travelers: Thousands of travelers trust Sejourne for their holiday accommodations. Our commitment to quality and service has earned us a loyal customer base and positive reviews.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Exclusive Deals: Enjoy exclusive discounts and special offers on selected properties. Our partnerships with property owners allow us to provide you with the best rates and unique promotions.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Local Insights: Get insider tips and recommendations from our local hosts. Discover the best places to eat, shop, and explore, and make the most of your holiday experience.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Text(
                'Join Our Community',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.sm),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Become part of the Sejourne community and start planning your next adventure today. Download our app, browse our listings, and find your perfect holiday home. Follow us on social media to stay updated on the latest news, travel tips, and exclusive offers.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Text(
                  'Thank you for choosing Sejourne Holiday Homes. We look forward to helping you create unforgettable memories!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: TSizes.md),
              Text(
                'Happy travels,',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'The Sejourne Holiday Homes Team',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
