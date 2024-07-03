import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/utils/const.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
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
              'Best Deals'.tr,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
                    hintText: 'Search deals...',
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
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
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
                            // topRight: Radius.circular(18),
                            // topLeft: Radius.circular(18),
                          ),
                          child: Stack(
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
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.black.withOpacity(
                                              0.7), // Blend color at the bottom
                                          Colors
                                              .transparent, // No blend at the top
                                        ],
                                      ).createShader(bounds);
                                    },
                                    blendMode: BlendMode.darken, // Blend mode
                                    child: Image.asset(
                                      "assets/food2.png", // Replace with your image asset path
                                      fit: BoxFit.cover,
                                      height: mQ.height * 0.19,
                                      width: mQ.width,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 14,
                                left: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                            color: kWhite,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w800
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'OFF',
                                            style: TextStyle(
                                              color: kWhite,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Text('5 days Remaining', style: TextStyle(
                                      color: kWhite,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,),),
                                    SizedBox(height: mQ.height * 0.015,),
                                    Text.rich(
                                      TextSpan(
                                        text: '\$0.00 / ',
                                        style: TextStyle(
                                          color: kDangerColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,

                                        ),
                                        children: [
                                          TextSpan(
                                            text: '\$0.00',
                                            style: TextStyle(
                                              color: kDangerColor,

                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: mQ.height * 0.01,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kPrimary,
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 18),
                                        child: Text(
                                          'Order Now'.tr,
                                          style: TextStyle(
                                            color: kWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: mQ.height * 0.003,),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: mQ.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pizza, Noodles, Soup',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: kGrey ,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: mQ.height * 0.017,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          color:
                                          kWhite.withOpacity(0.6),
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
                                            placeholder:
                                                (context, url) =>
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
                                          style:
                                          TextStyle( color: kPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,)),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.black54,
                                        size: 21,
                                      ),
                                      SizedBox(
                                        width: mQ.width * 0.02,
                                      ),
                                      Text(
                                        '34 KM',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mQ.height * 0.02,
                        ),
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

