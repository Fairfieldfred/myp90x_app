import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'constants.dart';

class WeightPicker extends StatefulWidget {
  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {

  int selected = 0;
  var weightToChoose = [5,8,10,12,15,20,25,30,35,40,45,50];

  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    //TODO: Need to getlastRepCount() and assign it to initial item.
    _scrollController = FixedExtentScrollController(initialItem: 5);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: CupertinoPicker(
          looping: true,
          scrollController: _scrollController,
          magnification: 1.0,
          diameterRatio: 0.7, // 1.1 is ios default
          offAxisFraction: 0.0, // -0.5 to 0.5,
          squeeze: 1.45, // ios default is 1.45
          // selectionOverlay: Text('$selected'),
          backgroundColor: kActiveCardColor,
          onSelectedItemChanged: (int value) {
            setState(() {
              selected = weightToChoose[value];
              print(selected);
            });
          },
          itemExtent: 20.0,
          children: [
            for (var weight in weightToChoose)
              Text('$weight', style: TextStyle(
                  color: selected == weight ? Colors.white: Colors.blue),)
          ],

        ),
      ),
    );
  }
}
