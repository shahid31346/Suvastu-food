import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:suvastufood/utils/const.dart';

class HomeSliverWithTab extends StatefulWidget {
  HomeSliverWithTab({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeSliverWithTab> createState() => _HomeSliverWithTabState();
}

class _HomeSliverWithTabState extends State<HomeSliverWithTab> {
  final controller = Get.put(SliverScrollController());
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
      body: Scrollbar(
        radius: const Radius.circular(8),
        notificationPredicate: (scroll) {
          controller.valueScroll.value = scroll.metrics.extentInside;
          return true;
        },
        child: GetX<SliverScrollController>(builder: (controller) {
          return DefaultTabController(
            length: 6,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: controller.scrollControllerGlobally,
              slivers: <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  stretch: true,
                  expandedHeight: 240,
                  pinned:
                      controller.globalOffsetValue.value < 90 ? true : false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      stretchModes: const [StretchMode.zoomBackground],
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
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
                            right: 10,
                            top:
                                (mQ.height + 20) - controller.valueScroll.value,
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
                          Positioned(
                            left: 10,
                            top:
                                (mQ.height + 20) - controller.valueScroll.value,
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: HeaderSliver(controller: controller),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = categories[index];
                    },
                    childCount: categories.length,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ProductCategory {
  ProductCategory({required this.category, required this.products});
  final String category;
  final List<Product> products;
}

class Product {
  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
  String name, description, image;
  String price;
}

// class SliverBodyItems extends StatelessWidget {
//   const SliverBodyItems({Key? key, required this.listItem}) : super(key: key);
//   final List<Product> listItem;
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

const headerTitle = 80.0;
typedef OnHeaderChange = void Function(bool visible);

class MyHeaderTitle extends SliverPersistentHeaderDelegate {
  MyHeaderTitle(this.title, this.onHeaderChange);
  final OnHeaderChange onHeaderChange;
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset > 0) {
      onHeaderChange(true);
    } else {
      onHeaderChange(false);
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => headerTitle;

  @override
  double get minExtent => headerTitle;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

// class _FlexibleSpaceBarHeader extends StatelessWidget {
//   const _FlexibleSpaceBarHeader(
//       {Key? key, required this.valueScroll, required this.controller})
//       : super(key: key);
//   final double valueScroll;
//   final SliverScrollController controller;
//   @override
//   Widget build(BuildContext context) {
//     final sizeHeight = MediaQuery.of(context).size.height;
//     return
//   }
// }

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

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            color: kWhite,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: percent > 0.1 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back,
                              color: kBlackColor,
                            ),
                          ),
                        ),
                      ),
                      AnimatedSlide(
                        duration: const Duration(microseconds: 300),
                        offset: Offset(percent < 0.1 ? -0.18 : 0.1, 0),
                        curve: Curves.easeIn,
                        child: Text(
                          'Its Eatoo',
                          style: khomeTitle.copyWith(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            letterSpacing: 0.4,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: percent > 0.0
                          ? Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                indicatorColor: Colors.green,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
                                tabs: [
                                  Tab(text: 'All'),
                                  Tab(text: 'Pizza'),
                                  Tab(text: 'Steak'),
                                  Tab(text: 'Burger'),
                                  Tab(text: 'Juice'),
                                  Tab(text: 'Desserts'),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
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
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                                SizedBox(
                                                    width: mQ.width * 0.02),
                                                Text(
                                                  'Open',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: kPrimary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: mQ.width * 0.01),
                                                Container(
                                                  height: mQ.height * 0.02,
                                                  width: mQ.width * 0.004,
                                                  decoration: BoxDecoration(
                                                      color: kGrey),
                                                ),
                                                SizedBox(
                                                    width: mQ.width * 0.01),
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
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                            border: Border.all(
                                                color: Colors.grey[300]!),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                  ]),
                            )),
                )
              ],
            ),
          ),
        ),
        if (percent > 0.1)
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: percent > 0.1
                      ? Container(
                          height: 0.5,
                          color: Colors.blue,
                        )
                      : null))
      ],
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class ListItemHeaderSliver extends StatelessWidget {
  ListItemHeaderSliver({Key? key, required this.controller}) : super(key: key);
  final SliverScrollController controller;
//  final controller = Get.put(SliverScrollController());

  @override
  Widget build(BuildContext context) {
    final itemsOffsets = controller.listOffsetItemHeader;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: ((notification) => true),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              right: size.width -
                  (itemsOffsets[itemsOffsets.length - 1] -
                      itemsOffsets[itemsOffsets.length - 2])),
          controller: controller.scrollControllerItemHeader,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: GetX<SliverScrollController>(builder: (controller) {
            return Row(
              children: List.generate(controller.listCategory.length, (index) {
                return GetBoxOffset(
                  offset: ((offset) {
                    itemsOffsets[index] = offset.dx;
                  }),
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: index == controller.headerNotifier.value.index
                          ? Colors.white
                          : null,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      controller.listCategory[index].category,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: index == controller.headerNotifier.value.index
                            ? Colors.red
                            : Colors.red,
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
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
  late List<ProductCategory> listCategory;
  //!value of offset
  late List<double> listOffsetItemHeader = [];
  //!header notifier
  var headerNotifier = MyHeader().obs;
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

  void loadDataRandom() {
    var productsTwo = [...products];
    var productsThree = [...products];
    var productsfour = [...products];
    productsTwo.shuffle();
    productsThree.shuffle();
    productsfour.shuffle();
    listCategory = [
      ProductCategory(category: 'Pickeds For You', products: products),
      ProductCategory(category: 'Common Order', products: productsTwo),
      ProductCategory(category: 'Vip Order', products: productsThree),
      ProductCategory(category: 'Hot Order ', products: productsfour)
    ];
  }

  @override
  void onInit() {
    loadDataRandom();
    listOffsetItemHeader =
        List.generate(listCategory.length, (index) => index.toDouble());
    //! get value of index in double  catecories
    scrollControllerGlobally = ScrollController();
    //! scroll controller for all page
    scrollControllerItemHeader = ScrollController();

    scrollControllerGlobally.addListener(_listenToScrollChange);
    headerNotifier.listen((value) {
      listenHeaderNotifier();
    });
    visibleHeader.listen((vlue) {
      listVisibleHeader();
    });

    super.onInit();
  }

//! check if the header is visible of not .. if the header is not
  listVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = MyHeader(index: 0, visible: false);
      return headerNotifier.value;
    }
  }

//? if index of  category item=the index of the header and the header visibility is true  make scroll to that index wit animation
  listenHeaderNotifier() {
    if (visibleHeader.value == true) {
      for (var i = 0; i < listCategory.length; i++) {
        if (headerNotifier.value.index == i &&
            headerNotifier.value.visible == true) {
          return scrollAnimationHorizontal(index: i);
        }
      }
    }
  }

//? if the index of the header and  the value is visible  make an scroll animation that header index
  void scrollAnimationHorizontal({required int index}) {
    if (headerNotifier.value.index == index &&
        headerNotifier.value.visible == true) {
      scrollControllerItemHeader.animateTo(
          listOffsetItemHeader[headerNotifier.value.index!] - 16,
          duration: const Duration(milliseconds: 500),
          curve: goingDown.value ? Curves.bounceInOut : Curves.fastOutSlowIn);
    }
  }

//? check if user scrool down or up--------------------------------
  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.reverse) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  void refreshHeader(
    int index,
    bool visible, {
    int? lastIndex,
  }) {
    final headerValue = headerNotifier.value;
    final headerTitle = headerValue.index;
    final headerVisible = headerValue.visible;
    if (headerTitle != index || lastIndex != null || headerVisible != visible) {
      Future.microtask(() {
        if (!visible && lastIndex != null) {
          headerNotifier.value = MyHeader(visible: true, index: lastIndex);
        } else {
          headerNotifier.value = MyHeader(visible: visible, index: index);
        }
      });
    }
  }

  @override
  void dispose() {
    scrollControllerItemHeader.dispose();
    scrollControllerGlobally.dispose();
    super.dispose();
  }
}

class MyHeader {
  MyHeader({this.index, this.visible});
  final int? index;
  final bool? visible;
}

final products = [
  Product(
      name: 'Bonanza cut',
      description:
          "Bonanza cut become exceptionally tasty, especially when braised or slow-cooked.",
      price: "\$39.0",
      image: "assets/sliver_with_tab/1.jpg"),
  Product(
      name: 'Chuck',
      description:
          "Chuck become exceptionally tasty, especially when braised or slow-cooked.",
      price: "\$9.0",
      image: "assets/sliver_with_tab/2.jpg"),
  Product(
      name: 'Flank steak',
      description:
          "Flank steak become exceptionally tasty, especially when braised or slow-cooked.",
      price: "\$56.0",
      image: "assets/sliver_with_tab/3.jpg"),
  Product(
      name: 'Merlot cut',
      description:
          "Merlot cut become exceptionally tasty, especially when braised or slow-cooked.",
      price: "\$8.0",
      image: "assets/sliver_with_tab/4.jpg"),
  Product(
      name: 'Oyster steak',
      description:
          "Oyster steak become exceptionally tasty, especially when braised or slow-cooked.",
      price: "\$20.0",
      image: "assets/sliver_with_tab/5.jpg"),
];
