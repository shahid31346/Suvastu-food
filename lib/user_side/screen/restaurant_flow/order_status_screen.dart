import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/review_orders_screen.dart';
import 'package:suvastufood/utils/const.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      body: Stack(
        children: [
          Container(
            height: mQ.height,
            child: Column(
              children: [
                Container(
                  height: mQ.height * 0.3,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), // Apply blend color
                        BlendMode.darken, // Blend mode
                      ),
                      opacity: 0.8,
                      fit: BoxFit.cover,
                      image: const AssetImage(
                        "assets/food.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: mQ.height * 0.7,
                  color: kWhite,
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: mQ.height * 0.05,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: kWhite,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: mQ.height * 0.17,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: mQ.width * 0.94,
                    height: mQ.height * 0.6,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: kGrey
                                .withOpacity(0.1), // Adjust opacity as needed
                            spreadRadius: 2, // Spread radius of the shadow
                            blurRadius: 3, // Blur radius of the shadow
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                        border: Border.all(color: kGrey.withOpacity(0.3)),
                        color: kWhite,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        color: kWhite.withOpacity(0.6),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.grey[300]!,
                                            width: 0.5),
                                      ),
                                      width: 50,
                                      height: 50,
                                      child: ClipOval(
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://w7.pngwing.com/pngs/736/269/png-transparent-food-background-food-fruit-gray-thumbnail.png',
                                          fit: BoxFit.cover,
                                          // Ensure the image covers the circular area
                                          placeholder: (context, url) => Center(
                                            child: CupertinoActivityIndicator(
                                              color: kPrimary,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            'assets/food.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mQ.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Driver',
                                          style: TextStyle(
                                              color: kGrey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          'Driver name',
                                          style: TextStyle(
                                              color: kBlackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                kDangerColor.withOpacity(0.8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.directions,
                                            color: kWhite,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mQ.width * 0.015,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimary.withOpacity(0.8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.call,
                                            color: kWhite,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mQ.width * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimary.withOpacity(0.8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.message,
                                            color: kWhite,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.015,
                            ),
                            Divider(
                              color: kGrey.withOpacity(0.1),
                            ),
                            SizedBox(
                              height: mQ.height * 0.015,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kGrey.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGrey.withOpacity(0.2),
                                        width: 0.5),
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: kDangerColor,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: mQ.width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order Pplace successfully',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Your order has been placed and we\'re searching driver for you',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.019,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kGrey.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGrey.withOpacity(0.2),
                                        width: 0.5),
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: kDangerColor,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: mQ.width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Confirm by vender',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Your order has been placed and we\'re searching driver for you',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.019,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kGrey.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGrey.withOpacity(0.2),
                                        width: 0.5),
                                  ),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: kDangerColor,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: mQ.width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Picked up by driver',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Your order has been placed and we\'re searching driver for you',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.019,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kGrey.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGrey.withOpacity(0.2),
                                        width: 0.5),
                                  ),
                                  // child: Icon(Icons.check_circle,color: kDangerColor, size: 40,),
                                ),
                                SizedBox(
                                  width: mQ.width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Driver is on the way',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'The driver is on the way with your order',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.019,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kGrey.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: kGrey.withOpacity(0.2),
                                        width: 0.5),
                                  ),
                                  // child: Icon(Icons.check_circle,color: kDangerColor, size: 40,),
                                ),
                                SizedBox(
                                  width: mQ.width * 0.04,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order delivered',
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Order has been delivered',
                                        style: TextStyle(
                                            color: kGrey,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: mQ.height * 0.025,
                            ),
                            Container(
                              height: mQ.height * 0.045,
                              width: mQ.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kGrey.withOpacity(0.1),
                              ),
                              child: Center(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'Estiated time of arrival ',
                                    style: TextStyle(
                                        color: kGrey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: '10 mintes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: mQ.height * 0.027,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Timer - 00:36",
                    ),
                  ),
                  SizedBox(
                    height: mQ.height * 0.08,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: mQ.width * 0.85,
                      height: 50,
                      child: ResuableButton(
                          text: "View Order Details".tr,
                          onPressed: () {
                            Get.to(ReviewOrdersScreen());
                          },
                          color: kSecondaryMain),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
