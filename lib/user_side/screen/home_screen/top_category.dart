import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:suvastufood/user_side/screen/home_screen/all_catergory.dart';
import 'package:suvastufood/utils/const.dart';

class TopCategory extends StatelessWidget {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert for you',
    'Drinks'
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Category
        Padding(
          padding:
              const EdgeInsets.only(left: 14.0, right: 14, top: 12, bottom: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Categories'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: mQ.height * 0.040,
                child: TextButton(
                  onPressed: () {
                    Get.to(AllCategory());
                  },
                  child: Text(
                    'See All'.tr,
                    style:
                        TextStyle(color: kPrimary, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 60,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                String label = categories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey.withOpacity(0.2)),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/food.png'),
                              ),
                              // border: Border.all(color: kGrey.withOpacity(0.4)),
                            ),
                            // child: Image.asset('assets/food.png')
                          ),
                          SizedBox(width: mQ.width * 0.02),
                          Text(label,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54)),
                        ],
                      )),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
