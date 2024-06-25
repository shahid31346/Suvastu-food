import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

class Availability extends StatelessWidget {
  final List<Map<String, dynamic>> availabilityItems = [
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Monday', 'time': '09:00 AM - 05:00 PM', 'isOpen': true},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    {'dayName': 'Tuesday', 'time': 'Closed', 'isOpen': false},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return SizedBox(height: mQ.height,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: availabilityItems.length,
        itemBuilder: (context, index) {
          final item = availabilityItems[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.1,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .color!
                      .withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8.0,
                    spreadRadius: 0.0,
                    offset: Offset(1.0, 1.0),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mQ.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['dayName'],
                          style: TextStyle(
                            color: kPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: item['isOpen'] ? kPrimary : kSecondaryMain,
                              ),
                            ),
                            SizedBox(
                              width: mQ.width * 0.015,
                            ),
                            Text(
                              item['isOpen'] ? 'Open' : 'Closed',
                              style: TextStyle(
                                fontSize: 14,
                                color: item['isOpen'] ? kPrimary : kSecondaryMain,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mQ.height * 0.015,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          size: 18,
                          color: kBlack54, // Customize color as needed
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          item['time'],
                          style: TextStyle(
                            fontSize: 14,
                            color: kBlack54, // Customize color as needed
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mQ.height * 0.01,
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
