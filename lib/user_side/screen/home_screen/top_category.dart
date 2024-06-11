import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:suvastufood/utils/const.dart';

class TopCategory extends StatelessWidget {
  final List<String> categories = [
    'Local Food',
    'Fast Food',
    'Dessert',
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
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(color: kPrimary, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(height: mQ.height * 0.02),
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
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGrey.withOpacity(0.4)),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Row(
                      children: [
                        Container(
                          height: 70,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
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
                );
              }),
        ),

        SizedBox(height: 20),
        // Food for you
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Food for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'See All',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class FoodCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FoodCard(),
        SizedBox(height: 10),
        FoodCard(),
        SizedBox(height: 10),
        FoodCard(),
      ],
    );
  }
}

class FoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              'https://via.placeholder.com/150',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fried Fish',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14),
                    SizedBox(width: 4),
                    Text('30 - 20 Min'),
                  ],
                ),
                Text('\$0.00'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
