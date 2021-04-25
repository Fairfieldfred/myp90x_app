import 'package:flutter/material.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:myp90x_app/components/rep_picker.dart';
import 'package:myp90x_app/components/weight_picker.dart';
import 'package:provider/provider.dart';
import 'package:myp90x_app/components/constants.dart';

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
              child: RepPicker(),
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
        Text('The last Max Rep Count was: ${exerciseModel.nextLastRep}'),
        Row(
          children: [
            Spacer(),
            SizedBox(
              height: 200.0,
              width: 100.0,
              child: RepPicker(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}

class FixedRepPickerView extends StatefulWidget {

  @override
  _FixedRepPickerViewState createState() => _FixedRepPickerViewState();
}

class _FixedRepPickerViewState extends State<FixedRepPickerView> {

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return  Column(
      children: [
        Text('The reps to do should be set to ${pickCorrectCount(exerciseModel.exerciseName)}'),
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

class DoneOrNotPickerView extends StatefulWidget {
  DoneOrNotPickerView();
  @override
  _DoneOrNotPickerViewState createState() => _DoneOrNotPickerViewState();
}

class _DoneOrNotPickerViewState extends State<DoneOrNotPickerView> {

 bool _yesHasBeenPressed = false;
 bool _noHasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    if (exerciseModel.doneOrNot == true){
      _yesHasBeenPressed = true;
      _noHasBeenPressed = false;
    } else {
      _yesHasBeenPressed = false;
      _noHasBeenPressed = true;
    }

    return  Column(
      children: [

        Row(
          children: [
            Spacer(),
            Text('Did You Do it? ',
            style: kResultTextStyle,),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.greenAccent,
                      primary: _yesHasBeenPressed ? Colors.greenAccent : Colors.yellowAccent,
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_yesHasBeenPressed == false){
                          _yesHasBeenPressed = true;
                          _noHasBeenPressed = false;
                        } else _yesHasBeenPressed = true;
                        exerciseModel.setNextDoneOrNot(true);
                      });
                    },
                    child: Text('Yes',
                    style: TextStyle(
                      color: _yesHasBeenPressed ? Colors.black : Colors.black26,
                    )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.greenAccent,
                      primary: _noHasBeenPressed ? Colors.greenAccent : Colors.yellowAccent,
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if(_noHasBeenPressed == false) {
                          _noHasBeenPressed = true;
                          _yesHasBeenPressed = false;
                        } else _noHasBeenPressed =true;
                        exerciseModel.setNextDoneOrNot(false);
                      });
                    },
                    child: Text('No',
                    style:  TextStyle(
                      color: _noHasBeenPressed ? Colors.black : Colors.black26,
                    ),),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}


// ElevatedButton(
// style: raisedButtonStyle,
// onPressed: () { },
// child: Text('Looks like a RaisedButton'),
// )
