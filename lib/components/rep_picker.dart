import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RepPicker extends StatefulWidget {
  @override
  _RepPickerState createState() => _RepPickerState();

  int getCurrentRep() {
    return _RepPickerState().selected;
  }
}

class _RepPickerState extends State<RepPicker> {

  int selected = 0;
  var repToChoose = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

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
          backgroundColor: Colors.orangeAccent,
          onSelectedItemChanged: (int value) {
            setState(() {
              selected = value + 1;
              print(selected);
            });
          },
          itemExtent: 20.0,
          children: [
            for (var rep in repToChoose)
              Text('$rep', style: TextStyle(
                  color: selected == rep ? Colors.black : Colors.blue),)
          ],

        ),
      ),
    );
  }
}
