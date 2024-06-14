import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/user_side/controller/home_controller.dart/home_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/get_started_screen.dart';
import 'package:suvastufood/user_side/screen/home_screen/food_for_you.dart';
import 'package:suvastufood/user_side/screen/home_screen/nearby_restaurants.dart';
import 'package:suvastufood/user_side/screen/home_screen/top_category.dart';
import 'package:suvastufood/utils/const.dart';
import 'package:badges/badges.dart' as badges;

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({super.key});

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 6, // Number of tabs
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 55,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.my_location,
                        color: kWhite,
                      ),
                    ),
                  ),
                ],
              ),
              expandedHeight: 180,
              pinned: true,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
              flexibleSpace: FlexibleSpaceBar(
                background: ClipPath(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black
                                  .withOpacity(0.5), // Apply blend color
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Its Eatoo',
                            style: khomeTitle.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              letterSpacing: 0.4,
                              fontSize: 16,
                            ),
                          ),
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
                                        color: Colors.yellow[800],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Its Eatoo',
                          style: khomeTitle.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            letterSpacing: 0.4,
                            fontSize: 16,
                          ),
                        ),
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
                                      color: Colors.yellow[800],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mQ.height * 0.01),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kGrey,
                          size: 16,
                        ),
                        SizedBox(width: mQ.width * 0.01),
                        Text("Township Sector A",
                            style: TextStyle(
                                color: kGrey,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(height: mQ.height * 0.015),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      runAlignment: WrapAlignment.start,
                      children: [
                        Container(
                          width: mQ.width * 0.45,
                          height: mQ.height * 0.042,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: kPrimary),
                                ),
                                SizedBox(width: mQ.width * 0.02),
                                Text(
                                  'Open',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: kPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: mQ.width * 0.01),
                                Container(
                                  height: mQ.height * 0.02,
                                  width: mQ.width * 0.004,
                                  decoration: BoxDecoration(color: kGrey),
                                ),
                                SizedBox(width: mQ.width * 0.01),
                                Text(
                                  'Close 10:00 am',
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: mQ.width * 0.20,
                          height: mQ.height * 0.042,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              '25 KM',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: mQ.width * 0.23,
                          height: mQ.height * 0.042,
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Free Delivery',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 60.0,
                maxHeight: 60.0,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorColor: Colors.green,
                    labelPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Pizza'),
                      Tab(text: 'Steak'),
                      Tab(text: 'Burger'),
                      Tab(text: 'Juice'),
                      Tab(text: 'Desserts'),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  Center(child: Text('All Items')),
                  Center(child: Text('Pizza Items')),
                  Center(child: Text('Steak Items')),
                  Center(child: Text('Burger Items')),
                  Center(child: Text('Juice Items')),
                  Center(child: Text('Desserts Items')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
