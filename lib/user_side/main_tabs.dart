import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_screen.dart';
import 'package:suvastufood/user_side/screen/home_screen/home_screen.dart';
import 'package:suvastufood/user_side/screen/orders_screen/orders_main.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/mycart_screen.dart';
import 'package:suvastufood/utils/const.dart';

class MainTabs extends StatefulWidget {
  MainTabs({
    super.key,
  });

  @override
  State<MainTabs> createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with AutomaticKeepAliveClientMixin {
  final appData = GetStorage();

  int _bottomNavIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    OrdersMain(),
    MyCartScreen(),
    LoginScreen(),
    MyCartScreen(),
  ];
  List<IconData> iconList = [
    CupertinoIcons.home,
    CupertinoIcons.square_list,
    CupertinoIcons.cart,
    CupertinoIcons.money_dollar_circle,
    CupertinoIcons.person,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  DateTime? lastTap;

  @override
  Widget build(BuildContext context) {
    List<String> iconLabel = [
      'Home'.tr,
      'Orders'.tr,
      'Cart'.tr,
      'Deals'.tr,
      'Profile'.tr,
    ];
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (lastTap != null &&
            now.difference(lastTap!) < const Duration(seconds: 2)) {
          SystemNavigator.pop();
          return true;
        }
        AnimatedSnackBar.material("Press back again to Exit!",
                type: AnimatedSnackBarType.info,
                mobileSnackBarPosition: MobileSnackBarPosition
                    .bottom, // Position of snackbar on mobile devices
                desktopSnackBarPosition: DesktopSnackBarPosition
                    .topRight, // Position of snackbar on desktop devices
                animationCurve: Curves.fastOutSlowIn)
            .show(context);

        lastTap = now;
        return false;
      },
      child: Scaffold(
        backgroundColor: kAppBackgroundColor,
        body: screens[_bottomNavIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? kPrimary : Colors.black54;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index],
                  size: 22,
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    iconLabel[index],
                    maxLines: 1,
                    style: TextStyle(
                        color: color,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            );
          },
          backgroundColor:
              Theme.of(context).colorScheme.background.withOpacity(0.95),
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          splashColor: Colors.transparent,
          splashRadius: 0,
          notchMargin: 8,
          notchSmoothness: NotchSmoothness.softEdge,
          elevation: 200,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
