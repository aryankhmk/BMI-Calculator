import 'package:flutter/material.dart';
import '/constants/app_constraints.dart';

class Rightbar extends StatelessWidget {
  final double barWith;

  const Rightbar({Key? key, required this.barWith}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: 25,
        margin: EdgeInsets.all(5),
        width: barWith,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: accentColor,
        ),
      )
    ]);
  }
}
