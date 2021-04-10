import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myp90x_app/components/rep_picker.dart';
import 'package:myp90x_app/components/weight_picker.dart';
import 'package:myp90x_app/components/constants.dart';


class  ExerciseScreen extends StatefulWidget {
  static const String id = 'exercise_screen';

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {

  int currentReps = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My_P90X'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('WorkOutName Here'),

          Row(
            children: [
              SizedBox(
                height: 200.0,
                width: 100.0,
                child: RepPicker(),
                ),
              SizedBox(
                height: 200.0,
                width: 100.0,
                child: WeightPicker(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



