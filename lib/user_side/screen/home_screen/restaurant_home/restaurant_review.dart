import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:suvastufood/utils/const.dart';

class Reviews extends StatelessWidget {
  final List<Map<String, dynamic>> availabilityItems = [
    {'dayName': 'Monday', 'time': '09:00 AM - 05:00 PM', 'isOpen': true},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: kWhite.withOpacity(0.6),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.grey[300]!, width: 0.5),
                        ),
                        height: 50,
                        width: 50,
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
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/food2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'User Name',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: kBlack54,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      starCount: 5,
                                      rating: 3.0,
                                      size: 20.0,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star,
                                      color: Colors.orange,
                                      borderColor: Colors.orange[200],
                                      spacing: 0.0)
                                ],
                              ),
                              SizedBox(height: mQ.height * 0.008),
                              SizedBox(height: mQ.height * 0.008),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when ',
                      style: TextStyle(
                          fontSize: 12,
                          color: kBlack54,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
