import 'package:flutter/material.dart';
import 'package:suvastufood/utils/const.dart';

class RoundedRadioListTile extends StatelessWidget {
  const RoundedRadioListTile({
    Key? key,
    this.isActive = false,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isActive;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(color: Colors.grey[400]!, width: 0.2)),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Row(
                  children: [
                    CircleCheckBox(isActive: isActive),
                    const SizedBox(width: 12),
                    Text(text,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)
                        // style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        //     color: titleColor.withOpacity(0.84), height: 1),
                        )
                  ],
                ),
              ),
            ),
          ),
          // const Divider(),
        ],
      ),
    );
  }
}

class CircleCheckBox extends StatelessWidget {
  const CircleCheckBox({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultDuration,
      height: 24,
      width: 24,
      padding: EdgeInsets.all(isActive ? 3 : 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive
              ? kPrimary.withOpacity(0.54)
              : const Color(0xFF868686).withOpacity(0.54),
          width: 0.8,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: kPrimary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
