import 'package:flutter/material.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/model/workoutData.dart';


class ExerciseModel extends ChangeNotifier {

  ExerciseModel();

  FixedExtentScrollController _repPickerScrollController = FixedExtentScrollController();
  FixedExtentScrollController get repPickerScrollController => _repPickerScrollController;

  String _workoutName = '';
  String get workoutName => _workoutName;

  String _exerciseName = '';
  String get exerciseName => _exerciseName;


  int _exerciseNumber = 0;
  int get exerciseNumber => _exerciseNumber;

  int _currentRep = 0;
  int get currentRep => _currentRep;

  int _lastRep = 0;
  int get lastRep => _lastRep;

  int _nextLastRep = 0;
  int get nextLastRep => _nextLastRep;

  int _currentWeight = 0;
  int get currentWeight => _currentWeight;

  void setExerciseNumber(int) {
    _exerciseNumber = int;
    notifyListeners();
  }

  void setCurrentRep(int) {
    _currentRep = int;
    notifyListeners();
  }
  void setLastRep(int) {
    _lastRep = int;
    notifyListeners();
  }
  void setNextLastRep(int) {
    _nextLastRep = int;
    notifyListeners();
  }

  void setCurrentWeight(int) {
    _currentWeight = int;
    notifyListeners();
  }
  void setCurrentWorkoutName(string) {
    _workoutName = string;
    notifyListeners();
  }
  void setCurrentExerciseName(string) {
    _exerciseName = string;
    notifyListeners();
  }
  // void setRepPickerScrollController(int) {
  //   _repPickerScrollController = FixedExtentScrollController(initialItem: int);
  //   notifyListeners();
  // }

  Future<int> getLastRep() async {
    List<Map<String,dynamic>> lastRep = await DatabaseHelper.instance.queryLastRep(workoutName, _exerciseName);
    return lastRep[0]['repCount'];
  }
}