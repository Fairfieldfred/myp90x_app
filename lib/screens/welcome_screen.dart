import 'package:flutter/material.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myp90x_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView(
        children: [
          for ( var workout  in workouts)
            Text(workouts.elementAt(workout).workoutName)
        ],
        itemExtent: 50.0,
        diameterRatio: 1.5,
        offAxisFraction: -0.1,
      ),
    );
  }
}