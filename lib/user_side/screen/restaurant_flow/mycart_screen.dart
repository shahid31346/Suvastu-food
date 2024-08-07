import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/checkout_screen.dart';
import 'package:suvastufood/utils/const.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert',
    'Drinks'
  ];

  // Second list of items to be applied to the bottom area
  final List<String> bottomItems = [
    'BBQ Sauce',
    'Mustard',
    'Ketchup',
    'BBQ Sauce',
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'My Cart'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: kSecondaryMain.withOpacity(0.05),
                  shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  deleteAlert(
                      message: "Are you sure to remove cart items",
                      title: "Delete",
                      context: context);
                },
                padding: EdgeInsets.zero,
                icon: Icon(CupertinoIcons.delete,
                    size: 20, color: kSecondaryMain),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [

          ListView.builder(
            padding:         const EdgeInsets.only(bottom: 80),
            shrinkWrap: true,
            primary: false,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
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
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 12, right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/food2.png', // Place your image asset here
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, right: 6.0, bottom: 10, left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Fried Fish',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: kBlackColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        decoration:
                                            BoxDecoration(shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () {
                                            deleteAlert(
                                                message:
                                                    "Are you sure to remove cart item",
                                                title: "Delete",
                                                context: context);
                                          },
                                          padding: EdgeInsets.zero,
                                          icon: Icon(CupertinoIcons.delete,
                                              size: 18, color: kGrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: mQ.height * 0.002),
                                  Text(
                                    '\$0.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kSecondaryMain,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(height: mQ.height * 0.015),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 33,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 4),
                                                constraints: const BoxConstraints(),
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 15,
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .color!
                                                      .withOpacity(0.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black.withOpacity(0.6),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Container(
                                            height: 33,
                                            width: 33,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(
                                                          0.4), // Shadow color
                                                  spreadRadius:
                                                      0, // No spreading of the shadow
                                                  blurRadius: 12,
                                                  offset: const Offset(0,
                                                      4), // Offset for vertical elevation
                                                ),
                                              ],
                                              color: Theme.of(context).primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 4, horizontal: 4),
                                                constraints: const BoxConstraints(),
                                                onPressed: () {
                                                  FocusScope.of(context).unfocus();
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: mQ.height * 0.008),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(color: kGray.withOpacity(0.3)),
                      ),
                      // New bottom section using the bottomItems list
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,

                          children: bottomItems.map((item) {
                            return SizedBox(
                              height: mQ.height * 0.023,
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Row(
                                   children: [ Container(
                                     height: 6,
                                     width: 6,
                                     decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       color: Theme.of(context)
                                           .primaryColor
                                           .withOpacity(0.4),
                                     ),
                                   ),
                                     SizedBox(width: 8.0), // Adjust width if needed
                                     Text(
                                       item,
                                       style: TextStyle(fontSize: 12, color: kGrey),
                                       textAlign: TextAlign.right,
                                     ),],
                                 ),
                                  Text(
                                    '\$00',
                                    style: TextStyle(fontSize: 12, color: kDangerColor),
                                    textAlign: TextAlign.right,
                                  ),

                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: mQ.height * 0.015),

                    ],
                  ),
                ),
              );
            },
          ),

          Positioned.fill(
            bottom: 12,

            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: mQ.width * 0.85,
                height: 50,
                child: ResuableButton(
                    text: "Confirm".tr,
                    onPressed: () {

                      Get.to(CheckoutScreen());
                    },
                    color: kSecondaryMain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///delete cart item

deleteAlert({String? message, String? title, BuildContext? context}) {
  showDialog(
      context: context!,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          insetAnimationCurve: Curves.easeInOutBack,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(title!),
          ),
          content: Text(message!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: false,
              child: const Column(
                children: <Widget>[
                  Text(
                    'No',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            CupertinoDialogAction(
                isDefaultAction: false,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 14, color: kSecondaryMain),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        );
      });
}
