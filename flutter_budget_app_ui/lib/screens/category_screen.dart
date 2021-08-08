import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_budget_app_ui/helper/color.dart';
import 'package:flutter_budget_app_ui/models/expense_model.dart';
import 'package:flutter_budget_app_ui/widgets/radial_painter.dart';
import '../models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  CategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    double totalamountspent = 0;
    category.expenses.forEach((Expense expanse) {
      totalamountspent += expanse.cost;
    });
    double amountleft = category.maxAmount - totalamountspent;
    double precentage = amountleft / category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
              height: 250.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(0, 2))
                  ]),
              child: Container(
                color: Colors.white,
                height: 250.0,
                padding: EdgeInsets.all(20),
                child: CustomPaint(
                  foregroundPainter: RadialPainter(
                      bgColor: Colors.grey,
                      lineColor: getColor(
                          context, totalamountspent, category.maxAmount),
                      percent: precentage,
                      width: 15.0),
                  child: Center(
                    child: Text(
                      '\$${amountleft.toStringAsFixed(2)} / \$${category.maxAmount}',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  title: Text(category.expenses[index - 1].name),
                  trailing: Text(
                    "\$ ${category.expenses[index - 1].cost.toStringAsFixed(2)}",
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ),
              ),
            );
          }
        },
        itemCount: category.expenses.length + 1,
      ),
    );
  }
}
