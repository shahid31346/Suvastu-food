import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suvastufood/test/test.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/food_details.dart';
import 'package:suvastufood/utils/const.dart';

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedItemIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: mQ.height * 0.06,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedItemIndex = index;
                    _pageController.jumpToPage(index);
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                              color: Color(0xFF0A111111),
                              blurRadius: 24,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                          color: selectedItemIndex == index
                              ? Colors.grey[800]
                              : kWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: kGrey, width: 0.2),
                          ),
                        ),
                        child: Text(
                          'Burger $index',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: selectedItemIndex == index ? kWhite : kGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectedItemIndex = index;
              });
            },
            children: List.generate(5, (index) => getPageContent(index)),
          ),
        ),
      ],
    );
  }

  Widget getPageContent(int index) {
    final mQ = MediaQuery.of(context).size;

    if (index == 0) {
      return CategoryScreen(category: 'Pizza');
    } else if (index == 1) {
      return CategoryScreen(category: 'Pizza');
    } else if (index == 2) {
      return CategoryScreen(category: 'Burger');
    } else {
      return CategoryScreen(category: 'Rice');
    }
  }
}

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 10),
          child: Text(
            category,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0, left: 16, right: 16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(FoodDetailsScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                              offset: Offset(1.0, 1.0),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/food2.png',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fried Fish',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          '\$0.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: mQ.height * 0.008),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_filled,
                                          size: 18,
                                          color: Colors.green,
                                        ),
                                        SizedBox(width: mQ.width * 0.02),
                                        Text(
                                          '30 - 20 Min',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: mQ.height * 0.008),
                                    Text(
                                      'With Lemon + Salad',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
