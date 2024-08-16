import 'package:sejourne/common/widgets/layouts/list_layout.dart';
import 'package:sejourne/common/widgets/texts/section_header.dart';
import 'package:sejourne/features/personalization/screens/payment/widgets/card_container.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/popups/general_popups/add_card_pop_up_form.dart';
import '../../../bookings/screens/booking_wizard_form/widgets/payments/widgets/transactions_history_container.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              /// App bar
              TAppBar(
                leadingIcon:Get.locale==arabic?TImage.rightArrowIcon: TImage.backArrow,
                title: Text(TTexts.paymentLabel.tr,style: Theme.of(context).textTheme.headlineSmall,),
              ),

              Text(
                TTexts.addPaymentMethod.tr,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: TSizes.sm,
              ),
              ListLayout(
                  padding: EdgeInsets.zero,
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => const CardContainer(
                        cardName: "Catalin Pustai",
                        cardNum: "4442-3434-3434-3344",
                        cardExpDate: "01/12",
                        cardCvv: "211",
                      ),
                  itemCount: 2),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => const AddCardPopUpForm()),
                child: TRoundedContainer(
                  width: double.infinity,
                  radius: TSizes.sm,
                  shadow: TShadowStyle.containerShadow,
                  padding: const EdgeInsetsDirectional.all(TSizes.md),
                  child: Center(
                    child: Text(
                      TTexts.addNewCard.tr,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.darkFontColor
                              : TColors.grey2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

               TSectionHeading(
                title: TTexts.transactionsHistory.tr,
                showActionButton: false,
              ),

              ListLayout(
                  padding: EdgeInsets.zero,
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) =>  TransactionsHistoryContainer(
                        transactionType: TTexts.transactionsType.tr,
                        cardNum: "**** **** **** 3344",
                        transactionMethod: "Visa Card",
                        transactionAmount: "1,000 AED",
                        transactionDate: "1 MAR 2024",
                        transactionInvoice: "SJ0032455",
                      ),
                  itemCount: 2)
            ],
          ),
        ),
      ),
    ));
  }
}
