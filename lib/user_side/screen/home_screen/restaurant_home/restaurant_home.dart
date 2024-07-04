import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:suvastufood/user_side/screen/home_screen/restaurant_home/restaurant_about.dart';
import 'package:suvastufood/user_side/screen/home_screen/restaurant_home/restaurant_availability.dart';
import 'package:suvastufood/user_side/screen/home_screen/restaurant_home/restaurant_menu.dart';
import 'package:suvastufood/user_side/screen/home_screen/restaurant_home/restaurant_review.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/chat_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/mycart_screen.dart';
import 'package:suvastufood/utils/const.dart';

class RestaurantHome extends StatefulWidget {
  RestaurantHome({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  final controller = Get.put(SliverScrollController());

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      body: GetX<SliverScrollController>(builder: (controller) {
        return DefaultTabController(
          length: 4,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller.scrollControllerGlobally,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                stretch: true,
                expandedHeight: 220,
                pinned: controller.globalOffsetValue.value < 80 ? true : false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  stretchModes: const [StretchMode.zoomBackground],
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned.fill(
                        child: Container(
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
                      ),
                      Positioned(
                        right: 16,
                        top: mQ.height * 0.05,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ChatScreen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.chat,
                                    color: kWhite,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: mQ.width * 0.05,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
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
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: mQ.height * 0.05,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: HeaderSliver(controller: controller),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  addAutomaticKeepAlives: false,
                  (context, index) {
                    return SizedBox(
                      height: mQ.height,
                      child: TabBarView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [Menu(), Availability(), About(), Reviews()],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondaryMain,
        onPressed: () {
          Get.to(MyCartScreen());
        },
        child: Icon(
          CupertinoIcons.cart,
          color: kWhite,
        ),
      ),
    );
  }
}

class HeaderSliver extends SliverPersistentHeaderDelegate {
  HeaderSliver({required this.controller});
  final SliverScrollController controller;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = shrinkOffset / 120;
    // controller.visibleHeader.value = true;
    if (percent > 0.1) {
      controller.visibleHeader.value = true;
    } else {
      controller.visibleHeader.value = false;
    }
    final mQ = MediaQuery.of(context).size;

    return Container(
      color: kWhite,
      height: 180,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: percent > 0.09 ? 26.0 : 5,
                left: percent > 0.09 ? 16.0 : 0,
                right: 16.0),
            child: Row(
              children: [
                AnimatedOpacity(
                  opacity: percent > 0.09 ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kBlackColor.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: kBlackColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSlide(
                    duration: const Duration(microseconds: 300),
                    offset: Offset(percent < 0.09 ? -0.18 : 0.1, 0),
                    curve: Curves.easeIn,
                    child: Text(
                      'Its Eatoo',
                      style: khomeTitle.copyWith(
                        color: kBlackColor,
                        letterSpacing: 0.4,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
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
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: percent > 0.09
                    ? Column(
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            color: kWhite,
                            child: TabBar(
                              tabAlignment: TabAlignment.fill,
                              indicatorColor: kPrimary,
                              labelPadding:
                                  EdgeInsets.symmetric(horizontal: 0.0),
                              tabs: [
                                Tab(text: 'Menu'),
                                Tab(text: 'Availability'),
                                Tab(text: 'About'),
                                Tab(text: 'Review'),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
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
                            ),
                            SizedBox(height: mQ.height * 0.012),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                runAlignment: WrapAlignment.start,
                                children: [
                                  Container(
                                    width: mQ.width * 0.42,
                                    height: mQ.height * 0.042,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 6,
                                            width: 6,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kPrimary),
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
                                            decoration:
                                                BoxDecoration(color: kGrey),
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
                                    width: mQ.width * 0.18,
                                    height: mQ.height * 0.042,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
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
                                    width: mQ.width * 0.24,
                                    height: mQ.height * 0.042,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
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
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              color: kWhite,
                              child: TabBar(
                                tabAlignment: TabAlignment.fill,
                                indicatorColor: Colors.green,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
                                tabs: [
                                  Tab(text: 'Menu'),
                                  Tab(text: 'Availability'),
                                  Tab(text: 'About'),
                                  Tab(text: 'Review'),
                                ],
                              ),
                            )
                          ])),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class GetBoxOffset extends StatefulWidget {
  final Widget child;
  final Function(Offset offset) offset;

  const GetBoxOffset({Key? key, required this.child, required this.offset})
      : super(key: key);

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {
  GlobalKey widgetKey = GlobalKey();
  late Offset offset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widgetKey,
      child: widget.child,
    );
  }
}

class SliverScrollController extends GetxController {
  //!List of product
  //!value of offset
  late List<double> listOffsetItemHeader = [];
  //!header notifier

  //!offset global key
  var globalOffsetValue = 0.0.obs;
  //!indicator if we are going down or up in the application
  var goingDown = false.obs;
  //! value to do the validations of the top icons
  var valueScroll = ValueNotifier<double>(0);
  //! to move top items in sliver
  late ScrollController scrollControllerItemHeader;
  //!to have overall control of scrolling
  late ScrollController scrollControllerGlobally;
  //!value indicate if the header is visible
  RxBool visibleHeader = false.obs;

  @override
  void onInit() {
    //! get value of index in double  catecories
    scrollControllerGlobally = ScrollController();
    //! scroll controller for all page
    scrollControllerItemHeader = ScrollController();

    scrollControllerGlobally.addListener(_listenToScrollChange);

    super.onInit();
  }

//? check if user scrool down or up--------------------------------
  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.forward) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  @override
  void dispose() {
    scrollControllerItemHeader.dispose();
    scrollControllerGlobally.dispose();
    super.dispose();
  }
}
