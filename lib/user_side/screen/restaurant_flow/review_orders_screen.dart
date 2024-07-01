import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/utils/const.dart';

class ReviewOrdersScreen extends StatefulWidget {
  const ReviewOrdersScreen({super.key});

  @override
  State<ReviewOrdersScreen> createState() => _ReviewOrdersScreenState();
}

class _ReviewOrdersScreenState extends State<ReviewOrdersScreen> {
  List<Map<String, dynamic>> items = [
    {'name': 'Special noodle', 'price': '\$000', 'quantity': '2'},
    {'name': 'Special noodle', 'price': '\$000', 'quantity': '2'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Review Order'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
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
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            decoration: BoxDecoration(
                              color: kGrey,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6.0, horizontal: 8),
                              child: Text(
                                '#45456',
                                style: TextStyle(
                                  color: kWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '22/8/2023',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.02,),
                      Text(
                        'Restaurant Address',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                      ),
                      SizedBox(height:  mQ.height * 0.005,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Dewan hareem , Township f assasa sdfa sdadafsdfasdfasdfasdfsadfasdfsadf',

                              style: TextStyle(
                                color: kBlackColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order type',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                          Text(
                            'Payment',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.005,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Take away',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            'COD',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

              ),
              SizedBox(height: mQ.height* 0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Order Items',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                ),
              ),
              SizedBox(height: mQ.height* 0.01,),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[index]['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                      Text(
                        items[index]['price'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kDangerColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: mQ.height * 0.002,),
                  Text(
                    'QTY: ${items[index]['quantity']}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: kBlack54,
                    ),
                  ),
                 // Adjust spacing as necessary
                  SizedBox(height:  mQ.height * 0.005,),
                  Divider(color: kGrey.withOpacity(0.2),),
                  SizedBox(height:  mQ.height * 0.005,),
                  SizedBox(height:  mQ.height * 0.005,),
                ],
              ),
            );
          }, 
        ),
              SizedBox(height: mQ.height* 0.02,),
        Container(
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
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub Total',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                          Text(
                            'Discount',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.005,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                          Text(
                            'Delivery amount',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.005,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '\$00',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:  mQ.height * 0.01,),
                              Divider(color: kGrey.withOpacity(0.3),),
                      SizedBox(height:  mQ.height * 0.01,),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                          Text(
                            '000',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kDangerColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

              ),
              SizedBox(
                height: mQ.height * 0.04,
              ),
              Center(
                child: SizedBox(
                  width: mQ.width * 0.85,
                  height: 50,
                  child: ResuableButton(
                      text: "Confirm".tr,
                      onPressed: () {
                        _showCancelOrderDialog(context);
                      },
                      color: kSecondaryMain),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showCancelOrderDialog(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment:
                      Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kPrimary.withOpacity(0.1),

                          shape: BoxShape.circle

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.info,
                            color: kPrimary,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mQ.height * 0.02),
                    Align(
                      alignment:
        Alignment.center,
        child: Text(

                        'Are You Sure You Want To\nCancel Your Order ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Reason of cancellation',

                      style: kTextFieldTitle
                    ),
                    SizedBox(height: mQ.height* 0.005,),
                    TextFormField(
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.3),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        isDense: true,
                        hintStyle: TextStyle(
                            color: Colors.grey[400]!,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        hintText: 'Type here...',
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[200]!, width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimary, width: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Center(
                          child: SizedBox(
                            width: mQ.width * 0.35,
                            height: 50,
                            child: ResuableButton(
                                text: "Yes".tr,
                                onPressed: () {},
                                color: kSecondaryMain),
                          ),
                        ),
                        SizedBox(
                          width: mQ.width * 0.35,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mQ.height * 0.01),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
