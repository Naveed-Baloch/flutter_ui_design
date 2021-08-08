import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_app_ui/data/data.dart';
import 'package:flutter_budget_app_ui/helper/color.dart';
import 'package:flutter_budget_app_ui/models/category_model.dart';
import 'package:flutter_budget_app_ui/models/expense_model.dart';
import 'package:flutter_budget_app_ui/screens/category_screen.dart';
import 'package:flutter_budget_app_ui/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildCategoryList(double totalAmountSpent, Category category) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => CategoryScreen(category),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    category.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(1)}'
                    ' / ${category.maxAmount}',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: 18.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  Container(
                    height: 18.0,
                    width: category.maxAmount / totalAmountSpent * 100,
                    decoration: BoxDecoration(
                        color: getColor(
                            context, totalAmountSpent, category.maxAmount),
                        borderRadius: BorderRadius.circular(10.0)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            floating: true,
            expandedHeight: 100.0,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Simple Budget'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, index) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20.0, 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: BarChart(),
                );
              } else {
                final Category category = categories[index - 1];
                double totalAmountSpent = 0;
                category.expenses.forEach((Expense expense) {
                  totalAmountSpent += expense.cost;
                });
                return _buildCategoryList(totalAmountSpent, category);
              }
            }, childCount: 1 + categories.length),
          )
        ],
      ),
    );
  }
}
