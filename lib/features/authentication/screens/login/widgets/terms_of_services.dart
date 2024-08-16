import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejourne/common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/containers/background_image_container.dart';
import '../../../../../data/services/app_variables.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TermsOfServicesScreen extends StatelessWidget {
  const TermsOfServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BackgroundImageContainer(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TAppBar(
                  title: Text(TTexts.termsOfUse.tr),
                  leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                ),
                const SectionTitle('1. Introduction'),
                const SectionContent(
                    'Welcome to Sejourne. By accessing or using our services, you agree to comply with and be bound by the following terms and conditions. Please read these Terms of Service carefully before using our website or services.'),
                const SectionTitle('2. Definitions'),
                const SectionContent(
                    '"Company": Refers to Sejourne.\n"User": Refers to any individual or entity using our services.\n"Services": Refers to the holiday home rental services provided by the Company.\n"Property": Refers to the holiday homes listed on our platform.'),
                const SectionTitle('3. Acceptance of Terms'),
                const SectionContent(
                    'By using our services, you agree to these Terms of Service and our Privacy Policy. If you do not agree, please do not use our services.'),
                const SectionTitle('4. Use of Services'),
                const SectionContent(
                    'Eligibility: You must be at least 18 years old to use our services.\nAccount Registration: You may need to create an account to access certain features. You agree to provide accurate and complete information and to update your information as necessary.\nProhibited Uses: You agree not to use our services for any unlawful or prohibited activities, including but not limited to fraud, harassment, or spamming.'),
                const SectionTitle('5. Booking and Payments'),
                const SectionContent(
                    'Booking: When you make a booking, you agree to comply with the property\'s rules and regulations.\nPayments: All payments must be made in accordance with our payment policies. We accept various forms of payment as specified on our website.\nCancellation Policy: Cancellations must be made in accordance with the cancellation policy specified at the time of booking.'),
                const SectionTitle('6. Responsibilities and Obligations'),
                const SectionContent(
                    'User Responsibilities: You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.\nCompany Responsibilities: We strive to provide accurate information and a secure platform, but we do not guarantee the accuracy, completeness, or reliability of any information or services provided.'),
                const SectionTitle('7. Property Listings'),
                const SectionContent(
                    'Accuracy: Property owners are responsible for ensuring the accuracy of their listings. The Company is not liable for any inaccuracies or misrepresentations.\nAvailability: We do not guarantee the availability of any property listed on our platform.'),
                const SectionTitle('8. User Conduct'),
                const SectionContent(
                    'Respectful Behavior: Users are expected to behave respectfully and responsibly. Any abusive, offensive, or illegal behavior may result in termination of your account.\nReviews and Feedback: Users may leave reviews and feedback. We reserve the right to remove any content that violates our policies.'),
                const SectionTitle('9. Intellectual Property'),
                const SectionContent(
                    'Ownership: All content on our website, including text, graphics, logos, and software, is the property of the Company or its licensors and is protected by intellectual property laws.\nLicense: You are granted a limited, non-exclusive, non-transferable license to use our services for personal use.'),
                const SectionTitle('10. Limitation of Liability'),
                const SectionContent(
                    'No Warranty: Our services are provided "as is" without any warranties, express or implied.\nLiability: The Company is not liable for any damages arising from the use of our services, including but not limited to direct, indirect, incidental, or consequential damages.'),
                const SectionTitle('11. Indemnification'),
                const SectionContent(
                    'You agree to indemnify and hold the Company harmless from any claims, damages, or expenses arising from your use of our services or violation of these Terms of Service.'),
                const SectionTitle('12. Termination'),
                const SectionContent(
                    'We reserve the right to terminate or suspend your account at any time, without notice, for conduct that we believe violates these Terms of Service or is harmful to other users of our services.'),
                const SectionTitle('13. Governing Law'),
                const SectionContent(
                    'These Terms of Service are governed by the laws of Dubai. Any disputes arising from these terms will be resolved in the courts of Dubai.'),
                const SectionTitle('14. Changes to Terms'),
                const SectionContent(
                    'We may update these Terms of Service from time to time. We will notify users of any significant changes by posting the new terms on our website. Your continued use of our services after any changes indicates your acceptance of the new terms.'),
                const SectionTitle('15. Contact Information'),
                const SectionContent(
                    'If you have any questions about these Terms of Service, please contact us at:\n\nSejourne'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  const SectionContent(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16),
    );
  }
}
