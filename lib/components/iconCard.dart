import 'package:flutter/material.dart';

import '../constants.dart';
import 'reusableCard.dart';

class IconCard extends StatelessWidget {
  final IconData iconPassed;
  final String data;
  final Color color;
  final void Function()? onTap;

  IconCard(
      {required this.iconPassed,
      required this.data,
      required this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      onTap: onTap,
      color: color,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconPassed,
            size: 80,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            data,
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
}
