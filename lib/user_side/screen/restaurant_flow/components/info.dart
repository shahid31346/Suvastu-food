import 'package:flutter/material.dart';
import 'package:suvastufood/user_side/screen/restaurant_flow/components/price_range_food_type.dart';
import 'package:suvastufood/utils/const.dart';

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.33,
          child: Image.asset(
            "assets/Header-image.png",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Fried Fish",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    size: 18,
                    color: kPrimary,
                  ),
                  SizedBox(width: mQ.width * 0.02),
                  Text(
                    '30 - 20 Min',
                    style: TextStyle(
                      fontSize: 13,
                      color: kPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
               Divider(
                color: Colors.grey[300],
                height: 0.6,
              ),
              const SizedBox(height: 20),
              const Text("Description",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(height: 4),
              const Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusa.",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black54)),
              const SizedBox(height: 22),
              // const PriceRangeAndFoodtype(
              //   foodType: ["Chinese", "American", "Deshi food"],
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
