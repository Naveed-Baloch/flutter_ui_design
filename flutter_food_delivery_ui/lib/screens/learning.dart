import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Learning extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning'),
      ),
      body: Container(
        color: Colors.indigoAccent,

        child: ClipRRect(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Text('sdsjf'),
            ],
          ),
        )
      ),
    );
  }
}
