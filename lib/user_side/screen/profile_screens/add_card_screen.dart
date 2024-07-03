
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/utils/const.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddNewCardState();
  }
}

class AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Card'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return ResponsiveBuilder(builder: (context, sizingInformation) {
                  double formWidth = sizingInformation.isMobile ? constraints.maxWidth * 0.97 : 500;
                  return Container(
                    color: Theme.of(context).colorScheme.background,
                    width: formWidth,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        CreditCardWidget(
                          glassmorphismConfig: useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          bankName: 'Bank Name'.tr,
                          frontCardBorder: !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                          backCardBorder: !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: Color(0xff363636),
                          backgroundImage: 'assets/card_background.png',
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            CustomCardTypeIcon(
                              cardType: CardType.mastercard,
                              cardImage: Image.asset(
                                'assets/mastercard.png',
                                height: 48,
                                width: 48,
                              ),
                            ),


                          ],
                        ),
                        Column(
                          children: <Widget>[
                            CreditCardForm(
                              formKey: formKey,
                              obscureCvv: true,
                              obscureNumber: true,

                              cardNumber: cardNumber,
                              cvvCode: cvvCode,
                              isHolderNameVisible: true,
                              isCardNumberVisible: true,
                              isExpiryDateVisible: true,
                              cardHolderName: cardHolderName,
                              expiryDate: expiryDate,
                              inputConfiguration:  InputConfiguration(
                                cardNumberDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withOpacity(0.1),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimary, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                  // labelText: 'Number',
                                  hintText: 'XXXX XXXX XXXX XXXX',
                                ),
                                expiryDateDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withOpacity(0.1),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kPrimary, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  hintText: 'XX/XX',
                                ),
                                cvvCodeDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: kGrey.withOpacity(0.1),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kPrimary, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  hintText: 'XXX',
                                ),
                                cardHolderDecoration: InputDecoration(
                                  hintText: 'Card Holder',
                                  filled: true,
                                  fillColor: kGrey.withOpacity(0.1),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey[300]!, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kPrimary, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                ),
                              ),
                              onCreditCardModelChange: onCreditCardModelChange,
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            SizedBox(
                              width: mQ.width * 0.85,
                              height: 50,
                              child: ResuableButton(
                                  text: "Add Card".tr,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                    } else {}
                                  },
                                  color: kPrimary),
                            ),


                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                });
              }),
            ),
          ),
        ),
      ),
    );
  }



  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}












