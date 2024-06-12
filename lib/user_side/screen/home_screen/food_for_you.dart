import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/user_side/screen/home_screen/all_food_for_you.dart';
import 'package:suvastufood/utils/const.dart';

class FoodCardList extends StatelessWidget {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert',
    'Drinks'
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 14.0, right: 14, top: 5, bottom: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Food for you'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: mQ.height * 0.045,
                child: TextButton(
                  onPressed: () {
                    Get.to(AllFoodForYou());
                  },
                  child: Text(
                    'See All'.tr,
                    style:
                        TextStyle(color: kPrimary, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 10),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = categories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: mQ.width * 0.36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.4,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black26,
                    //     blurRadius: 6.0,
                    //     spreadRadius: 0.0,
                    //     offset:
                    //         Offset(2.0, 2.0), // shadow direction: bottom right
                    //   )
                    // ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(
                                    0.7), // Blend color at the bottom
                                Colors.transparent, // No blend at the top
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.darken, // Blend mode
                          child: Image.asset(
                            "assets/food.png", // Replace with your image asset path
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: mQ.height * 0.005),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule,
                                  color: kWhite.withOpacity(0.8),
                                  size: 18,
                                ),
                                SizedBox(width: mQ.width * 0.005),
                                Text(
                                  '30-40 min'.tr,
                                  style: TextStyle(
                                    color: kWhite.withOpacity(0.8),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.5,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: mQ.height * 0.005),
                            Text(
                              '\$300',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kWhite.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
