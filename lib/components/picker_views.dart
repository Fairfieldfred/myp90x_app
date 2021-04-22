import 'package:flutter/material.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:myp90x_app/components/rep_picker.dart';
import 'package:myp90x_app/components/weight_picker.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:provider/provider.dart';

class DefaultPickerView extends StatefulWidget {
  DefaultPickerView();
  @override
  _DefaultPickerViewState createState() => _DefaultPickerViewState();
}

class _DefaultPickerViewState extends State<DefaultPickerView> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return  Column(
      children: [
        Text('The repPicker should be set to ${exerciseModel.nextLastRep}'),
        Row(
          children: [
            Spacer(),
            SizedBox(
              height: 200.0,
              width: 100.0,
              child: RepPicker(exerciseModel.nextLastRep),
            ),
            Spacer(),
            SizedBox(
              height: 200.0,
              width: 100.0,
              child: WeightPicker(),
            ),
            Spacer()
          ],
        ),
      ],
    );
  }
}

class MaxRepPickerView extends StatefulWidget {
  MaxRepPickerView();
  @override
  _MaxRepPickerViewState createState() => _MaxRepPickerViewState();
}

class _MaxRepPickerViewState extends State<MaxRepPickerView> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return  Column(
      children: [
        Text('The repPicker should be set to ${exerciseModel.nextLastRep}'),
        Row(
          children: [
            Spacer(),
            SizedBox(
              height: 200.0,
              width: 100.0,
              child: RepPicker(exerciseModel.nextLastRep),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class FixedRepPickerView extends StatefulWidget {
  FixedRepPickerView();
  @override
  _FixedRepPickerViewState createState() => _FixedRepPickerViewState();
}

class _FixedRepPickerViewState extends State<FixedRepPickerView> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return  Column(
      children: [
        Text('The repPicker should be set to ${exerciseModel.nextLastRep}'),
        Row(
          children: [
            Spacer(),
            Text(pickCorrectCount(exerciseModel.exerciseName)),
            Spacer(),
            SizedBox(
              height: 200.0,
              width: 100.0,
              child: WeightPicker(),
            ),
            Spacer()
          ],
        ),
      ],
    );
  }

  String pickCorrectCount(String exerciseName) {
  switch (exerciseName) {
    case 'Congdon Locomotives' 'Weighted Circles':
      return '40';
    case '80-20 Siebers Speed Squats':
      return '30';
    case 'Calf Raise Squats' 'Calf Raises' 'Balance Lunges' 'Super Skaters':
      return '25';
    case 'Alternating Side Lunges':
      return '24';
    case 'Twenty-Ones':
      return '21';
    case 'Dead Lift Squats' 'Toe Roll Iso Lunges':
      return '20';
    case  'Step Back Lunges' 'Three-Way Lunges':
      return '15';
    case 'Squat Run':
      return 'Max';
    default:
      return '16';
  }

  }
}

