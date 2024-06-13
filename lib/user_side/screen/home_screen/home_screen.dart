import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/global/auth_textfield.dart';
import 'package:suvastufood/user_side/controller/home_controller.dart/home_controller.dart';
import 'package:suvastufood/user_side/screen/auth_screens/get_started_screen.dart';
import 'package:suvastufood/user_side/screen/home_screen/food_for_you.dart';
import 'package:suvastufood/user_side/screen/home_screen/nearby_restaurants.dart';
import 'package:suvastufood/user_side/screen/home_screen/top_category.dart';
import 'package:suvastufood/utils/const.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 55,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      color: kWhite,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Obx(
                    () => homeController.locationLoader.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              CupertinoActivityIndicator(color: kWhite),
                            ],
                          )
                        : GestureDetector(
                            onTap: () async {
                              homeController.getCurrentLocation(true);
                            },
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    homeController.currentPostCode.value,
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: kWhite,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 20,
                                  color: kWhite.withOpacity(0.4),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    changeLanguageBottomSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        CupertinoIcons.globe,
                        color: kWhite,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: mQ.width * 0.03),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: badges.Badge(
                        badgeContent: Text('3'),
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: kWhite,
                        ),
                      )),
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
                        color: Theme.of(context).primaryColor.withOpacity(0.2),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            kPrimary.withOpacity(0.5), // Apply blend color
                            BlendMode.darken, // Blend mode
                          ),
                          opacity: 0.1,
                          fit: BoxFit.cover,
                          image: new AssetImage(
                            "assets/food.png",
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: TextFormField(
                              controller: homeController.searchController,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3),
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon:
                                    Icon(Icons.search, color: kGrey, size: 20),
                                suffixIcon: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.tune)),
                                fillColor: kWhite,
                                isDense: true,
                                hintStyle: TextStyle(
                                    color: Colors.grey[400]!,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                hintText: 'Search restaurant, food',
                                border: const OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300]!, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kPrimary, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Obx(
                () => homeController.isNoInternet.value
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: mQ.height * 0.18,
                            ),
                            Icon(
                              Icons.signal_wifi_off,
                              color: Colors.grey[300],
                              size: 60,
                            ),
                            SizedBox(
                              height: mQ.height * 0.01,
                            ),
                            Text(
                              'No internet'.tr,
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: mQ.height * 0.035,
                            ),
                            OutlinedButton(
                              child: Text(
                                'Refresh'.tr,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                              onPressed: () async {},
                            ),
                          ],
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopCategory(),
                          FoodCardList(),
                          NearbyRestaurants()
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Padding homeTitle({required String title, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 14.0),
    child: Text(
      title,
      style: khomeTitle.copyWith(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        letterSpacing: 0.4,
        fontSize: 16,
      ),
    ),
  );
}
