import 'package:flutter/material.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myp90x_app/components/rounded_button.dart';
import 'package:myp90x_app/screens/exercise_screen.dart';


String currentWorkout = '';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          for (var i = 0; i < workouts.length; i++ )
            TextButton(
                child: Text('${workouts[i].workoutName}'),
                onPressed: (){
                  currentWorkout = workouts[i].workoutName;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExerciseScreen(workouts[i])));
                }
                ),
        ],
        itemExtent: 50.0,

      ),
    );
  }
}