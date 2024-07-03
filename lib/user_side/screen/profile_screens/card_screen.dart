import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/profile_screens/add_card_screen.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/mycart_screen.dart';
import 'package:suvastufood/utils/const.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return  Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: (){Get.to(AddNewCard());},child: Icon(Icons.add, color: kWhite,),backgroundColor: kPrimary,),
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Card'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: ListView.builder(
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
                    offset: Offset(1.0, 1.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 19),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Card no',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: kBlack54,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(
                              height: mQ.height * 0.004,
                            ),
                            Text(
                              '0000 0000 0000 0000',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: kSecondaryMain.withOpacity(0.05),
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              deleteAlert(
                                  message: "Are you sure to remove card",
                                  title: "Delete",
                                  context: context);
                            },
                            padding: EdgeInsets.zero,
                            icon: Icon(CupertinoIcons.delete,
                                size: 20, color: kSecondaryMain),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: mQ.height * 0.018,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Card Holder Name',
                          style: TextStyle(
                              fontSize: 12,
                              color: kBlack54,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          height: mQ.height * 0.004,
                        ),
                        Text(
                          'Full name',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mQ.height * 0.018,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Card no',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: kBlack54,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(
                              height: mQ.height * 0.004,
                            ),
                            Text(
                              '08/35',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'CVV',
                              style: TextStyle(
                                  fontSize: 12.6,
                                  color: kBlack54,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(
                              height: mQ.height * 0.004,
                            ),
                            Text(
                              '234',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kDangerColor,
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
            ),
          );
        },
      ),
    );
  }
}
