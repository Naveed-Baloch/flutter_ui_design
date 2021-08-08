import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final lable;
  final amountSpent;
  final mostExpansive;
  final double _maxHeight = 150.0;

  Bar({this.lable, this.amountSpent, this.mostExpansive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpansive * _maxHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          width: 18.0,
          height: barHeight,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0)),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          lable,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
