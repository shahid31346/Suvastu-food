import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'package:suvastufood/utils/const.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: khomeTitle.copyWith(
              color: kBlackColor,
              letterSpacing: 0.4,
              fontSize: 16,
            ),
          ),
          SizedBox(height: mQ.height * 0.01),
          Text(
              'It is a long established fact that a reader will be distracted by the  readable content of a page when looking at its layout. The point of  using Lorem Ipsum is that it has a more-or-less normal distribution of  letters, as opposed to using  making it  look like readable English',
              style: TextStyle(color: kBlack54))
        ],
      ),
    );
  }
}
