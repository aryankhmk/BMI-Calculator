import 'package:flutter/material.dart';
import '/constants/app_constraints.dart';

class Leftbar extends StatelessWidget {
  final double barWidth;
  const Leftbar({
    required this.barWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        height: 25,
        margin: EdgeInsets.all(5),
        width: barWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: accentColor,
        ),
      )
    ]);
  }
}
