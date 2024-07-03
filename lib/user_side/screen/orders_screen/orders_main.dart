import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/user_side/screen/auth_screens/login_with_email.dart';
import 'package:suvastufood/user_side/screen/orders_screen/active_orders.dart';
import 'package:suvastufood/user_side/screen/orders_screen/orders_history.dart';
import 'package:suvastufood/utils/const.dart';

class OrdersMain extends StatefulWidget {
  const OrdersMain({super.key});

  @override
  State<OrdersMain> createState() => _OrdersMainState();
}

class _OrdersMainState extends State<OrdersMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: Text(
          "Orders".tr,
          style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Builder(builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: mQ.height * 0.01,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: mQ.height * 0.055,
                    width: mQ.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.4))),
                    child: ButtonsTabBar(
                      radius: 20,
                      contentPadding: EdgeInsets.only(
                        left: mQ.width * 0.17,
                        right: mQ.width * 0.18,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      unselectedBackgroundColor: Colors.transparent,
                      unselectedLabelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      onTap: (index) {
                        // Handle tab selection
                        _tabController.animateTo(index);
                        setState(() {
                          tabIndex = index;
                        });
                      },
                      tabs: [
                        Tab(
                          text: "Active".tr,
                        ),
                        Tab(
                          text: "History".tr,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mQ.height * 0.02,
                ),

                // Adjust the height as needed
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: <Widget>[
                      ActiveOrders(),
                      OrdersHistory(),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
