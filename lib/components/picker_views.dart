import 'package:flutter/material.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:myp90x_app/components/rep_picker.dart';
import 'package:myp90x_app/components/weight_picker.dart';
import 'package:myp90x_app/components/picker_views.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:provider/provider.dart';

class DefaultPickerView extends StatelessWidget {

  DefaultPickerView(this.workoutName, this.exerciseName);

  String workoutName;
  String exerciseName;

  // var lastRepCount = Future <int> getLastRep() async {
  // List<Map<String,dynamic>> lastRep = await DatabaseHelper.instance.queryLastRep(workoutName,exerciseName);
  // return lastRep[0]['repcount'] as int;
  // }

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Row(
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
    );
  }
}