import 'package:flutter/material.dart';
import 'package:flutter_budget_app_ui/learning_custom_painter/widgets/circle.dart';
import 'package:flutter_budget_app_ui/learning_custom_painter/widgets/circle_progress.dart';
import 'package:flutter_budget_app_ui/learning_custom_painter/widgets/image.dart';
import 'package:flutter_budget_app_ui/learning_custom_painter/widgets/rounded_rectangle.dart';
import 'package:flutter_budget_app_ui/learning_custom_painter/widgets/triangle.dart';
import 'widgets/draw_line.dart';
import 'widgets/rectangle_painter.dart';

class LearningHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Custom Painter Demo'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Line',
                ),
                Tab(
                  text: 'Rectangle',
                ),
                Tab(
                  text: 'Rounded Rectangle',
                ),
                Tab(
                  text: 'Circle',
                ),
                Tab(
                  text: 'TriAngle',
                ),
                Tab(
                  text: 'Image',
                ),
                Tab(
                  text: 'Circle Progress',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LinePainter(),
              RectanglePainter(),
              RoundedRectangle(),
              Circle(),
              TriAngle(),
              ImageDrawer(),
              CircleProgress()
            ],
          ),
        ));
  }
}
