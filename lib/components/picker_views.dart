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

  RepPicker rPicker = RepPicker();

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Row(
        children: [
          Spacer(),
          SizedBox(
            height: 200.0,
            width: 100.0,
            child: rPicker,
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