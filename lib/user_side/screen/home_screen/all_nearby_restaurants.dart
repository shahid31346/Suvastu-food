import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/utils/const.dart';

class AllNearbyRestaurants extends StatefulWidget {
  const AllNearbyRestaurants({super.key});

  @override
  State<AllNearbyRestaurants> createState() => _AllNearbyRestaurantsState();
}

class _AllNearbyRestaurantsState extends State<AllNearbyRestaurants> {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: kBgColor,
            centerTitle: true,
            title: Text(
              'Restaurants'.tr,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(60.0), // Height of the TextFormField
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: TextFormField(
                  // controller: homeController.searchController,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3),
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.search, color: kGrey, size: 20),
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.tune)),
                    fillColor: kWhite,
                    isDense: true,
                    hintStyle: TextStyle(
                        color: Colors.grey[400]!,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    hintText: 'Search restaurant, food',
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = categories[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: kWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                      border: Border.all(
                        width: 0.4,
                        color: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .color!
                            .withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.9),
                                  spreadRadius: 20,
                                  blurRadius: 280,
                                  offset: const Offset(18,
                                      -18), // Positive x-value for moving shadow to the right
                                ),
                              ],
                            ),
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(
                                        0.6), // Blend color at the bottom
                                    Colors.transparent, // No blend at the top
                                  ],
                                ).createShader(bounds);
                              },
                              blendMode: BlendMode.darken, // Blend mode
                              child: Image.asset(
                                "assets/food2.png", // Replace with your image asset path
                                fit: BoxFit.cover,
                                height: mQ.height * 0.215,
                                width: mQ.width,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 5,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: kWhite,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6.0, horizontal: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Iconsax.discount_circle5,
                                            color: Colors.red,
                                            size: 18,
                                          ),
                                          Text(
                                            '  upto 10 % off'.tr,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: mQ.width * 0.08),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 8,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
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
                                          width: 40,
                                          height: 40,
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  'https://w7.pngwing.com/pngs/736/269/png-transparent-food-background-food-fruit-gray-thumbnail.png',
                                              fit: BoxFit.cover,
                                              // Ensure the image covers the circular area
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CupertinoActivityIndicator(
                                                  color: kPrimary,
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                'assets/food.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: mQ.width * 0.02),
                                        Text("Khuraki",
                                            style: TextStyle(color: kWhite)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: mQ.width * 0.08),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white.withOpacity(0.2)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[800],
                                            size: 18,
                                          ),
                                          SizedBox(width: mQ.width * 0.01),
                                          Text("3.7",
                                              style: TextStyle(
                                                  color: Colors.yellow[800])),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
