import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:smooth_star_rating_nsafe/smooth_star_rating.dart';
import 'package:suvastufood/global/resuable_button.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/order_sucess_dialog.dart';
import 'package:suvastufood/utils/const.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Write Review'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:     EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
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
             child: Column(
               children: [
                 Row(
                   children: [
                     Expanded(
                       flex: 4,
                       child: Padding(
                         padding: const EdgeInsets.only(
                           left: 8.0,
                           right: 12.0,
                           top: 12.0,
                         ),
                         child: SizedBox(
                           child: Stack(
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child: Image.asset(
                                   'assets/food2.png', // Place your image asset here
                                   // width: mQ.width * 0.4,
                                   height: 80,
                                   fit: BoxFit.cover,
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ),
                     ),
                     Expanded(
                       flex: 8,
                       child: Padding(
                         padding: const EdgeInsets.all(12.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Row(
                               mainAxisAlignment:
                               MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   'Fried Fish',
                                   overflow: TextOverflow.ellipsis,
                                   style: TextStyle(
                                     color: kBlackColor,
                                     fontWeight: FontWeight.w700,
                                     fontSize: 14,
                                   ),
                                 ),
                                 Container(
                                   decoration: BoxDecoration(
                                     color: Theme.of(context).primaryColor,
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
                               ],
                             ),
                             SizedBox(height: mQ.height * 0.006),
                             Text(
                               '4 Items',
                               style: TextStyle(
                                 fontSize: 12,
                                 color: kBlack54,
                               ),
                             ),
                             SizedBox(height: mQ.height * 0.008),
                             Text(
                               '22/6/2024 - 09:32 PM',
                               style: TextStyle(
                                 fontSize: 12,
                                 color: kBlack54,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),


               ],
             ),
           ),
              SizedBox(
                height: mQ.height * 0.025,
              ),

              Divider(color: kGrey.withOpacity(0.2),),
              SizedBox(height:  mQ.height * 0.02,),
              Text(
                'How Is Your Experience ?',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.5,
                ),
              ),
              SizedBox(height:  mQ.height * 0.01,),
              Text(
                'Your Overall Rating',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500, color: kBlack54),
              ),
              SizedBox(height:  mQ.height * 0.02,),
              SmoothStarRating(
                  allowHalfRating: false,
                  starCount: 5,
                  rating: 3.0,
                  size: 40.0,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star,
                  color: Colors.orange,
                  borderColor: Colors.orange[200],
                  spacing: 0.0),
              SizedBox(height:  mQ.height * 0.025,),

              Divider(color: kGrey.withOpacity(0.2),),
              SizedBox(height:  mQ.height * 0.01,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    'Write your review',

                    style: kTextFieldTitle
                ),
              ),
              SizedBox(height: mQ.height* 0.005,),
              TextFormField(
                maxLines: 12,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.3),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200]!,
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
              SizedBox(height: mQ.height* 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [


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
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: mQ.width * 0.35,
                      height: 50,
                      child: ResuableButton(
                          text: "Submit".tr,
                          onPressed: () {
                            showOrderSuccessDialog(context);
                          },
                          color: kSecondaryMain),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mQ.height * 0.01),

            ],
          ),
        ),
      ),
    );
  }
}
