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

  ExerciseModel();

  String _workoutName = '';
  String get workoutName => _workoutName;

  String _exerciseName = '';
  String get exerciseName => _exerciseName;


  int _exerciseNumber = 0;
  int get exerciseNumber => _exerciseNumber;

  int _currentRep = 0;
  int get currentRep => _currentRep;

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

  Future<int> getLastRep() async {
    List<Map<String,dynamic>> lastRep = await DatabaseHelper.instance.queryLastRep(workoutName, _exerciseName);
    return lastRep[0]['repCount'];
  }
}