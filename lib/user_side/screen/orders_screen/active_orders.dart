import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/utils/const.dart';

class ActiveOrders extends StatefulWidget {
  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert',
    'Drinks'
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      body: ListView.builder(
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
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 12.0,
                            top: 12.0,
                          ),
                          child: SizedBox(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/food2.png', // Place your image asset here
                                    // width: mQ.width * 0.4,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
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
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
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
                                ],
                              ),
                              SizedBox(height: mQ.height * 0.006),
                              Text(
                                '4 Items',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kBlack54,
                                ),
                              ),
                              SizedBox(height: mQ.height * 0.008),
                              Text(
                                '22/6/2024 - 09:32 PM',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: kBlack54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: kGray.withOpacity(0.3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow[700]!),
                            ),
                            SizedBox(
                              width: mQ.width * 0.015,
                            ),
                            Text(
                              'Active',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow[700]!),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                        Text(
                          '\$0.00',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mQ.height * 0.015,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
