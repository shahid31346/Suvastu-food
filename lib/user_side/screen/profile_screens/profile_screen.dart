import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/profile_screens/card_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/edit_profile_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/my_address_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/chat_screen.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/recieved_message.dart';
import 'package:suvastufood/utils/const.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Profile'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: kWhite.withOpacity(0.6),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.grey[300]!, width: 0.5),
                        ),
                        width: 60,
                        height: 60,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://w7.pngwing.com/pngs/736/269/png-transparent-food-background-food-fruit-gray-thumbnail.png',
                            fit: BoxFit.cover,
                            // Ensure the image covers the circular area
                            placeholder: (context, url) => Center(
                              child: CupertinoActivityIndicator(
                                color: kPrimary,
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/food.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mQ.width * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                color: kBlackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'email@gmail.com',
                            style: TextStyle(
                                color: kGrey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(EditProfileScreen());
                    },
                    icon: Icon(
                      Icons.edit,
                      color: kPrimary,
                      size: 27,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: mQ.height * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                        color:
                            kGrey.withOpacity(0.1), // Adjust opacity as needed
                        spreadRadius: 1, // Spread radius of the shadow
                        blurRadius: 7, // Blur radius of the shadow
                        offset: Offset(2, 3), // Offset of the shadow
                      ),
                    ],
                    border:
                        Border.all(color: kGrey.withOpacity(0.2), width: 0.5),
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: kPrimary,
                            size: 26.0,
                          ),
                          SizedBox(
                            width: mQ.width * 0.03,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: kBlackColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                        child: CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                          activeColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: mQ.height * 0.02,
              ),
              ListTileWidget(
                context,
                icon: Icons.account_balance_wallet,
                text: 'Wallet',
              ),
              ListTileWidget(context,
                  icon: Icons.credit_card_sharp,
                  text: 'Card', onListPressed: () {
                Get.to(CardScreen());
              }),
              ListTileWidget(context, icon: Icons.chat, text: 'Chat',
                  onListPressed: () {
                Get.to(ChatScreen());
              }),
              ListTileWidget(context,
                  icon: Icons.location_on,
                  text: 'My Address', onListPressed: () {
                Get.to(MyAddressScreen());
              }),
              ListTileWidget(
                context,
                icon: Icons.account_balance,
                text: 'Bank Info',
              ),
              ListTileWidget(context, icon: Icons.settings, text: 'Setting',
                  onListPressed: () {
                Get.to(SettingScreen());
              }),
              SizedBox(
                height: mQ.height * 0.1,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: mQ.width * 0.85,
                  height: 50,
                  child: ResuableButton(
                      text: "Logout".tr,
                      onPressed: () {},
                      color: kSecondaryMain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ListTileWidget(BuildContext context,
      {required IconData icon,
      required String text,
      VoidCallback? onListPressed}) {
    final mQ = MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: onListPressed,
          child: Container(
            decoration: BoxDecoration(
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: kGrey.withOpacity(0.1), // Adjust opacity as needed
                    spreadRadius: 1, // Spread radius of the shadow
                    blurRadius: 7, // Blur radius of the shadow
                    offset: Offset(2, 3), // Offset of the shadow
                  ),
                ],
                border: Border.all(color: kGrey.withOpacity(0.2), width: 0.5),
                borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: kPrimary,
                    size: 26.0,
                  ),
                  SizedBox(
                    width: mQ.width * 0.03,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: mQ.height * 0.02,
        )
      ],
    );
  }
}
