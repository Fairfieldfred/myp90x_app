import 'package:flutter/material.dart';
import 'package:myp90x_app/components/constants.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:myp90x_app/screens/exercise_screen.dart';

String currentWorkout = '';

class WelcomeScreen extends StatefulWidget {

  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My P90X WorkSheet',
          style: kProgramNameTextStyle),
        backgroundColor: Colors.black,
      ),
      body:
          ListView(
            children: [
              for (var i = 0; i < workouts.length; i++ )
                   Card(
                     color: Colors.blue,
                     child: TextButton(
                        child:
                            Row(
                              children: [
                                Card(
                                  child: Image(
                                    image: AssetImage('images/${workouts[i].workoutName}.png'),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Text(workouts[i].workoutName,
                                    maxLines: 2,
                                    style: kWorkoutListTextStyle
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        onPressed: (){
                          currentWorkout = workouts[i].workoutName;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ExerciseScreen(workouts[i])));
                        }
                      ),
                   ),
            ],
            itemExtent: 100.0,
          ),
      );
  }
}