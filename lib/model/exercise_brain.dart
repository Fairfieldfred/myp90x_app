import 'package:flutter/material.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/model/workoutData.dart';

class ExerciseBrain {

  ExerciseBrain({required this.workoutName});

  final String workoutName;


  // int getLastRep() {
  //   // return databaseHelper
  // }
}

class ExerciseModel extends ChangeNotifier {

  ExerciseModel(this._currentRep);

  int _exerciseNumber = 0;
  int get exerciseNumber => _exerciseNumber;

  int _currentRep = 0;
  int get currentRep => _currentRep;

  int _currentWeight = 0;
  int get currentWeight => _currentWeight;

  void increment() {
    _exerciseNumber++;
    notifyListeners();
  }

  void setCurrentRep(int) {
    _currentRep = int;
    notifyListeners();
  }

  void setCurrentWeight(int) {
    _currentWeight = int;
    notifyListeners();
  }
}