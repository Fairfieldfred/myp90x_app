import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myp90x_app/components/constants.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:provider/provider.dart';

class WeightPicker extends StatefulWidget {
  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {

  int selected = 0;
  var weightToChoose = [0,5,8,10,12,15,20,25,30,35,40,45,50];

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    FixedExtentScrollController _scrollController = FixedExtentScrollController(initialItem: weightToChoose.indexOf(exerciseModel.nextLastWeight));


    return Column(
      children: [
        Text('Weight',
            style: kPickerViewPickerTextStyle),
        SizedBox(height: 15),
        Container(
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: CupertinoPicker(
                looping: true,
                scrollController: _scrollController,
                magnification: 1.0,
                diameterRatio: 0.7, // 1.1 is ios default
                offAxisFraction: 0.0, // -0.5 to 0.5,
                squeeze: 1.3, // ios default is 1.45
                // selectionOverlay: Text('$selected'),
                backgroundColor: Colors.black,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    selected = weightToChoose[value];
                    exerciseModel.setCurrentWeight(selected);
                  });
                },
                itemExtent: 30.0,
                children: [
                  for (var weight in weightToChoose)
                    Text('$weight', style: TextStyle(
                        color: selected == weight ? Colors.white: Colors.blueAccent),)
                ],

              ),
            ),
          ),
        ),
      ],
    );
  }
}
