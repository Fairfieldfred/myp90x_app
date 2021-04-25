import 'package:flutter/material.dart';
import 'package:myp90x_app/components/database_helper.dart';

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

  int _currentWeight = 0;
  int get currentWeight => _currentWeight;

  bool _doneOrNot = false;
  bool get doneOrNot => _doneOrNot;

  int _nextLastRep = 0;
  int get nextLastRep => _nextLastRep;

  int _nextLastWeight = 0;
  int get nextLastWeight => _nextLastWeight;


    void setExerciseNumber(int) {
      _exerciseNumber = int;
      notifyListeners();
    }
    void setNextDoneOrNot(bool) {
      _doneOrNot = bool;
      notifyListeners();
    }
    void setNextlastWeight(int) {
      _nextLastWeight = int;
      notifyListeners();
    }
    void setCurrentRep(int) {
      _currentRep = int;
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
  }
