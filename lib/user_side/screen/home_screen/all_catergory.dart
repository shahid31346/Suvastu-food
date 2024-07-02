import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:suvastufood/utils/const.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({super.key});

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert',
    'Dessert',
    'Dessert',
    'Dessert',
    'Dessert',
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
          'Categories'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
        return GridView.builder(
          primary: false,
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: sizingInformation.isDesktop
                ? 4
                : sizingInformation.isTablet
                    ? 3
                    : 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 18.0,
            childAspectRatio: kIsWeb && sizingInformation.isTablet
                ? MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 0.93)
                : sizingInformation.isMobile
                    ? MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2.5)
                    : !kIsWeb && sizingInformation.isTablet
                        ? MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.4)
                        : MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 0.6),
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
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
                          Text(
                            '30+ Restaurant',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kWhite.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.5,
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
        );
      }),
    );
  }
}
