import 'package:flutter/material.dart';
import 'package:suvastufood/global/primary_button.dart';
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
  int quantity = 1;


  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
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
              backgroundColor: Colors.black.withOpacity(0.1),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
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
                    const RequiredSectionTitle(title: "Extra's"),
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
                 
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding)
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 55,
              decoration:
                  //  BoxDecoration(color: Theme.of(context).colorScheme.background),
                  BoxDecoration(
                //  color: Colors.red,
                color: Theme.of(context).colorScheme.background,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 38,
                          width: 38,
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
                              horizontal: 12),
                          child: Text(numOfItems.toString().padLeft(2, "0"),
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        SizedBox(
                          height: 38,
                          width: 38,
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
                    Container(
                      height: mQ.height * 0.058,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.6), // Shadow color
                            spreadRadius: 0, // No spreading of the shadow
                            blurRadius: 16,
                            offset: const Offset(
                                0, 4), // Offset for vertical elevation
                          ),
                        ],
                      ),
                      child: PrimaryButton(
                        onPressed: () {},
                        label:
                            "${'Add to cart'} (Rs 12.25)",
                        elevation: 3,
                        bgColor: Theme.of(context).primaryColor,
                        labelStyle: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
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
