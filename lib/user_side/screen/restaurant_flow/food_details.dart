import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

import 'components/info.dart';
import 'components/required_section_title.dart';
import 'components/rounded_checkedbox_list_tile.dart';

// ignore: must_be_immutable
class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  // for demo we select 2nd one
  int choiceOfTopCookie = 1;

  int choiceOfBottomCookie = 1;

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              backgroundColor: Colors.black.withOpacity(0.5),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Info(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequiredSectionTitle(title: "Variation"),
                    const SizedBox(height: defaultPadding),
                    ...List.generate(
                      variety.length,
                      (index) => RoundedCheckboxListTile(
                        isActive: index == choiceOfTopCookie,
                        text: variety[index],
                        press: () {
                          setState(() {
                            choiceOfTopCookie = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    const RequiredSectionTitle(
                        title: "Extra's"),
                    const SizedBox(height: defaultPadding),
                    ...List.generate(
                      choiceOfTopCookies.length,
                      (index) => RoundedCheckboxListTile(
                        isActive: index == choiceOfBottomCookie,
                        text: choiceOfTopCookies[index],
                        press: () {
                          setState(() {
                            choiceOfBottomCookie = index;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: defaultPadding),
                    // // Num of item
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(Icons.remove),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Text(numOfItems.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const OrderDetailsScreen(),
                        //   ),
                        // );
                      },
                      child: const Text("Add to Order (\$11.98)"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding)
            ],
          ),
        ),
      ),
    );
  }

  List<String> choiceOfTopCookies = [
    "Choice of top Cookie",
    "Cookies and Cream",
    "Funfetti",
    "M and M",
    "Red Velvet",
    "Peanut Butter",
    "Snickerdoodle",
    "White Chocolate Macadamia",
  ];

    List<String> variety = [
    "Small",
    "Medium",
    "Large",
  ];
}
