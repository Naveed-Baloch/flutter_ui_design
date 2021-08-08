import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_budget_app_ui/data/data.dart';

import 'bar.dart';

class BarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double mostExpansive = 0.0;
    weeklySpending.forEach((price) {
      if (mostExpansive<price) {
        mostExpansive = price;
      }
    });
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(
            'WeeklySpending',
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text(
                'Nov 10,2019 - Nov 16,2019',
                style: TextStyle(
                  fontSize: 14.0,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
            ],
          ),
          SizedBox(height: 13.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bar(
                lable: 'Sa',
                amountSpent: weeklySpending[0],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'Su',
                amountSpent: weeklySpending[1],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'Mo',
                amountSpent: weeklySpending[2],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'Tu',
                amountSpent: weeklySpending[3],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'We',
                amountSpent: weeklySpending[4],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'Th',
                amountSpent: weeklySpending[5],
                mostExpansive: mostExpansive,
              ),
              Bar(
                lable: 'Fr',
                amountSpent: weeklySpending[6],
                mostExpansive: mostExpansive,
              ),
            ],
          )
        ],
      ),
    );
  }
}
