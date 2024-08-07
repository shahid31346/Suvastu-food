import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/dialogs/cancel_order_dialog.dart';
import 'package:suvastufood/user_side/screen/dialogs/order_success_dialog.dart';
import 'package:suvastufood/utils/const.dart';

class OrdersDetailsScreen extends StatefulWidget {
  const OrdersDetailsScreen({super.key});

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  List<Map<String, dynamic>> items = [
    {'name': 'Special noodle', 'price': '\$000', 'quantity': '2'},
    {'name': 'Special noodle', 'price': '\$000', 'quantity': '2'},
    // Add more items as needed
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
          'Order Details'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 8),
                              child: Text(
                                '#45456',
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '22/8/2023',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle_rounded,
                              size: 17, color: kDangerColor),
                          SizedBox(
                            width: mQ.width * 0.01,
                          ),
                          Text(
                            'Pick-up Point',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.005,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Dewan hareem , Township f assasa sdfa sdadafsdfasdfasdfasdfsadfasdfsadf',
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              size: 17, color: kPrimary),
                          SizedBox(
                            width: mQ.width * 0.01,
                          ),
                          Text(
                            'Pick-off Point',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.005,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Township f assasa sdfa ',
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order type',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                          Text(
                            'Payment',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Take away',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            'COD',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Order Items',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.01,
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              items[index]['name'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                            Text(
                              items[index]['price'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kDangerColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mQ.height * 0.002,
                        ),
                        Text(
                          'QTY: ${items[index]['quantity']}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kBlack54,
                          ),
                        ),
                        // Adjust spacing as necessary
                        SizedBox(
                          height: mQ.height * 0.005,
                        ),
                        Divider(
                          color: kGrey.withOpacity(0.2),
                        ),
                        SizedBox(
                          height: mQ.height * 0.005,
                        ),
                        SizedBox(
                          height: mQ.height * 0.005,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: mQ.height * 0.02,
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
                      offset:
                          Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                          Text(
                            'Discount',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                          Text(
                            'Delivery amount',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mQ.height * 0.01,
                      ),
                      Divider(
                        color: kGrey.withOpacity(0.3),
                      ),
                      SizedBox(
                        height: mQ.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '000',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kDangerColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.04,
              ),
              Center(
                child: SizedBox(
                  width: mQ.width * 0.85,
                  height: 50,
                  child: ResuableButton(
                      text: "Cancel".tr,
                      onPressed: () {
                        showOrderSuccessDialog(context);
                      },
                      color: kSecondaryMain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
