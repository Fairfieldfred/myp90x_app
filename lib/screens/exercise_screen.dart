import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myp90x_app/components/picker_views.dart';
import 'package:myp90x_app/components/rounded_button.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:provider/provider.dart';


class  ExerciseScreen extends StatefulWidget {
  static const String id = 'exercise_screen';
  ExerciseScreen(this.workoutData);

  final WorkoutData workoutData;

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState(workoutData);
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  _ExerciseScreenState(this.workoutData);

  final WorkoutData workoutData;

  int currentRep = 0;
  int exerciseNumber = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('My_P90X'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(workoutData.workoutName),
          Text(workoutData.exercises[exerciseNumber]),
          Text('The current rep Count is: ${exerciseModel.currentRep.toString()}'),
          Text('The current weight is: ${exerciseModel.currentWeight.toString()}'),
          Text('The current exercise Number is: ${exerciseNumber.toString()}'),
          DefaultPickerView(workoutData.workoutName, workoutData.exercises[exerciseNumber]),
          Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  child: Text('Back') ,
                  onPressed: () {

                    if (exerciseNumber >= 1) {
                      exerciseNumber --;
                      exerciseModel.setExerciseNumber(exerciseNumber);
                    }

                    setState(() {
                      }
                     );
                  },),
              TextButton(onPressed: () async {
                int i = await DatabaseHelper.instance.insert({ //the insert method will always return the internal id of the record(an Integer)
                  DatabaseHelper.columnWorkoutName: workoutData.workoutName,
                  DatabaseHelper.columnExerciseName: workoutData.exercises[exerciseNumber],
                  DatabaseHelper.columnDateTime: DateTime.now().millisecondsSinceEpoch,
                  DatabaseHelper.columnDoneOrNot: '',
                  DatabaseHelper.columnRepCount: exerciseModel.currentRep,
                  DatabaseHelper.columnWeight: exerciseModel.currentWeight,//regardless of the data entered.
                });
                print('The inserted id is $i');
                List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
                print(queryRows);
                List<Map<String,dynamic>> lastRep = await DatabaseHelper.instance.queryLastRep(workoutData.workoutName,workoutData.exercises[exerciseNumber]);
                print(lastRep[0]['repCount']);
                //TODO Need to set last rep count in exerciseModel
              },
                child: Text('Save'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                ),
                child: Text('Next') ,
                onPressed: () {

                  setState(() {
                    if (exerciseNumber < workoutData.exercises.length - 1) {
                      exerciseNumber ++;
                      exerciseModel.setExerciseNumber(exerciseNumber);
                    }
                    }
                    );
                  }
                ),

            ],
          ),
        ],
      ),
    );
  }
}





