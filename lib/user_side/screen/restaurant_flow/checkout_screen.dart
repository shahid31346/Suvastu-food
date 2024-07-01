import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/global/primary_button.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/utils/const.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _deliveryOption = 'Delivery';
  String selectedPaymentMethod = 'Cash on Delivery';

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Checkout'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  border: Border.all(
                    width: 0.2,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      checkoutListTileWidget('Total', '\$0.00'),
                      checkoutListTileWidget('Tax', '\$0.00'),
                      couponCodeTextField(),
                      checkoutListTileWidget('Net Total', '\$0.00',
                          isNetTotal: true),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhite,
                  border: Border.all(
                    width: 0.2,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .color!
                        .withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    deliveryMethodWidget('Delivery'),
                    if (_deliveryOption == 'Delivery') ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Township Swat Sector Aship Swat Sector sadasdasda sdsaSDFASDFASDFdasdaDA dA D asdA DASDsadsadasdasdsadasdasdA',
                                style: TextStyle(fontSize: 12, color: kBlack54),
                              ),
                            ),
                            SizedBox(
                              height: mQ.height * 0.06,
                              width: mQ.width * 0.2,
                              child: TextButton(
                                onPressed: () {
                                  // Handle edit action
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(color: kPrimary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Colors.grey[200]!,
                        height: 10,
                      ),
                    ),
                    deliveryMethodWidget('Take Away'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Divider(
                        color: Colors.grey[200]!,
                        height: 10,
                      ),
                    ),
                    deliveryMethodWidget('Dine In'),
                  ],
                ),
              ),
              SizedBox(
                height: mQ.height * 0.02,
              ),
              paymentMethodWidget(
                title: _deliveryOption == 'Dine In'
                    ? 'Cash by Hand'
                    : 'Cash on Delivery',
                icon: Iconsax.moneys,
              ),
              paymentMethodWidget(title: 'Credit Card', icon: Iconsax.card),
              SizedBox(
                height: mQ.height * 0.04,
              ),
              Center(
                child: SizedBox(
                  width: mQ.width * 0.85,
                  height: 50,
                  child: ResuableButton(
                      text: "Confirm".tr,
                      onPressed: () {},
                      color: kSecondaryMain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget checkoutListTileWidget(String label, String amount,
      {bool isNetTotal = false}) {
    final mQ = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: kBlack54),
          ),
          Text(
            amount,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isNetTotal ? kPrimary : kBlack54),
          ),
        ],
      ),
    );
  }

  Widget couponCodeTextField() {
    final mQ = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              child: TextFormField(
                // controller: homeController.searchController,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.3),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100]!,
                  isDense: true,
                  hintStyle: TextStyle(
                      color: Colors.grey[400]!,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  hintText: 'Coupon code',
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey[300]!, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimary, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            height: mQ.height * 0.04,
            width: mQ.width * 0.18,
            decoration: BoxDecoration(
              boxShadow: [],
            ),
            child: Center(
              child: PrimaryButton(
                onPressed: () {},
                label: "Apply",
                elevation: 2,
                bgColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget deliveryMethodWidget(String option) {
    return Row(
      children: [
        Radio<String>(
          value: option,
          groupValue: _deliveryOption,
          onChanged: (value) {
            setState(() {
              _deliveryOption = value!;
            });
          },
        ),
        Text(
          option,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: kBlack54),
        ),
      ],
    );
  }

  Widget paymentMethodWidget({String? title, IconData? icon}) {
    final mQ = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: mQ.height * 0.008),
      child: Container(
        decoration: BoxDecoration(
          color: selectedPaymentMethod == title ? kPrimary : kWhite,
          border: Border.all(
            width: 0.2,
            color:
                Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            )
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          dense: true,
          trailing: selectedPaymentMethod == title
              ? Icon(
                  Icons.check_circle,
                  color: kWhite,
                )
              : SizedBox(),
          leading: Icon(icon,
              size: 28,
              color: selectedPaymentMethod == title ? kWhite : kBlack54),
          title: Text(
            title!,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selectedPaymentMethod == title ? kWhite : kBlack54),
          ),
          onTap: () {
            setState(() {
              selectedPaymentMethod = title;
            });
          },
        ),
      ),
    );
  }
}
