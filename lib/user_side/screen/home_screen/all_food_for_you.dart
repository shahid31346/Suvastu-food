import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:suvastufood/utils/const.dart';

class AllFoodForYou extends StatefulWidget {
  @override
  State<AllFoodForYou> createState() => _AllFoodForYouState();
}

class _AllFoodForYouState extends State<AllFoodForYou> {
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
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Food for you'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isDiscounted = true;
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
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
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
                            isDiscounted == true
                                ? Container(
                                    width: mQ.width,
                                    height: 20,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: kSecondaryMain.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'UP TO 10% OFF',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox()
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                '\$0.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kSecondaryMain,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          SizedBox(height: mQ.height * 0.008),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                size: 18,
                                color: kPrimary,
                              ),
                              SizedBox(width: mQ.width * 0.02),
                              Text(
                                '30 - 20 Min',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: mQ.height * 0.008),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: kWhite.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 0.5),
                                ),
                                width: 30,
                                height: 30,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://t3.ftcdn.net/jpg/02/52/38/80/360_F_252388016_KjPnB9vglSCuUJAumCDNbmMzGdzPAucK.jpg',
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
                              SizedBox(width: mQ.width * 0.02),
                              Text(
                                'Its Eatoo',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: kBlack54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
