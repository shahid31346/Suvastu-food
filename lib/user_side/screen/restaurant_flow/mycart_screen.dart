import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:suvastufood/utils/const.dart';

class MyCartScreen extends StatefulWidget {
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
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
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'My Cart'.tr,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isDiscounted = true;
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/food2.png', // Place your image asset here
                          // width: mQ.width * 0.4,
                          height: 80,
                          fit: BoxFit.cover,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Text(
                                '\$0.00',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          SizedBox(height: mQ.height * 0.002),
                          Row(
                            children: [
                            
                              Text(
                                'Grilled Fished, 1 Kilo, ',
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: kPrimary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: mQ.height * 0.008),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      color: Colors.black
                                          .withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 4),
                                        constraints: const BoxConstraints(),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.remove,
                                          size: 15,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color!
                                              .withOpacity(0.8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                        height: 33,
                                    width: 33,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(
                                                  0.4), // Shadow color
                                          spreadRadius:
                                              0, // No spreading of the shadow
                                          blurRadius: 12,
                                          offset: const Offset(0,
                                              4), // Offset for vertical elevation
                                        ),
                                      ],
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 4),
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.white
                                              ,
                                        ),
                                      ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
