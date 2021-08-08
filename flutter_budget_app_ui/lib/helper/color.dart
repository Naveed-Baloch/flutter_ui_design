import 'package:flutter/material.dart';

Color getColor(BuildContext context, double totalamount, double maxamount) {
  double percentage = (maxamount - totalamount) / maxamount;
   if (percentage >= .50)
    return Theme.of(context).primaryColor;
  else if(percentage>=.25)
    return Colors.orange;
  else
    return Colors.red;
}
