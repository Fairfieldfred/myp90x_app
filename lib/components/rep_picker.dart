import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:myp90x_app/model/exercise_brain.dart';

class RepPicker extends StatefulWidget {
  @override
  _RepPickerState createState() => _RepPickerState();
}

class _RepPickerState extends State<RepPicker> {

  int selected = 0;

  var repToChoose = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

  @override
  void initState() {
    //TODO: Need to getlastRepCount() and assign it to initial item.
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final exerciseModel = context.watch<ExerciseModel>();
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CupertinoPicker(
          looping: true,

          magnification: 1.0,
          diameterRatio: 0.7, // 1.1 is ios default
          offAxisFraction: 0.0, // -0.5 to 0.5,
          squeeze: 1.45, // ios default is 1.45
          // selectionOverlay: Text('$selected'),
          backgroundColor: Colors.black,
          onSelectedItemChanged: (int value) {
            setState(() {
              selected = value + 1;
              print(selected);
              exerciseModel.setCurrentRep(selected);
            });
          },
          itemExtent: 20.0,
          children: [
            for (var rep in repToChoose)
              Text('$rep', style: TextStyle(
                  color: selected == rep ? Colors.white: Colors.blue),)
          ],

        ),
      ),
    );
  }

 int getSelectedRep(){
    return selected;
 }
}
