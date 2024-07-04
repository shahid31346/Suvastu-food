import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/profile_screens/add_address_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/mycart_screen.dart';
import 'package:suvastufood/utils/const.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'My Address'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            shrinkWrap: true,
            primary: false,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: 12,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(
                      width: 0.2,
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .color!
                          .withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(1.0, 1.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 19),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: kPrimary,
                            size: 40,
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Home',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: mQ.height * 0.005,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Khyber pukhtton khwa mi sa sdn asdsdgora city swat',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: kBlack54,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                deleteAlert(
                                    message: "Are you sure to remove address",
                                    title: "Alert",
                                    context: context);
                              },
                              padding: EdgeInsets.zero,
                              icon: Icon(CupertinoIcons.delete,
                                  size: 22, color: kDangerColor),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
            bottom: 14,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: mQ.width * 0.85,
                height: 50,
                child: ResuableButton(
                    text: "Add New Location".tr,
                    onPressed: () {
                      Get.to(AddAddressScreen());
                    },
                    color: kSecondaryMain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
