import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myp90x_app/components/constants.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/components/picker_views.dart';
import 'package:myp90x_app/components/video_screen.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatefulWidget {
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

  final PageController controller = PageController(initialPage: 0);

  pickNextView() {
    final exerciseModel = context.watch<ExerciseModel>();
    return Card(
      color: Colors.deepPurpleAccent,
      child: PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          for (var exercisePage in exerciseModel.currentWorkout.exercises)
            ShowCorrectView(exercisePage),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(exerciseModel.currentWorkout.workoutName,
            maxLines: 2, style: kWorkoutNameTextStyle),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15.0),
          Card(
            color: Colors.lightGreenAccent,
            shadowColor: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Text(
                  exerciseModel
                      .currentWorkout.exercises[exerciseModel.exerciseNumber],
                  textAlign: TextAlign.center,
                  style: kWorkoutNameCardTextStyle),
            ),
          ),
          Expanded(flex: 2, child: YouTubePlayer()),
          // Below is used for testing
          // Text('The current rep Count is: ${exerciseModel.currentRep.toString()}'),
          // Text('The current weight is: ${exerciseModel.currentWeight.toString()}'),
          // Text('The current exercise Number is: ${exerciseNumber.toString()}'),
          // Text('The exerciseModel.nextLastRep value is ${exerciseModel.nextLastRep}'),
          // Text('The exerciseModel.nextLastWeight value is ${exerciseModel.nextLastWeight}'),
          Expanded(flex: 2, child: pickNextView()),
          // Spacer(),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.orangeAccent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.arrow_left,
                        size: 25.0,
                        color: Colors.black,
                      ),
                      Text(' Back'),
                    ],
                  ),
                  onPressed: () async {
                    if (exerciseNumber >= 1) {
                      List<Map<String, dynamic>> nextLastRep =
                          await DatabaseHelper.instance.queryLastRep(
                              workoutData.workoutName,
                              workoutData.exercises[exerciseNumber - 1]);
                      exerciseModel.setNextLastRep(nextLastRep[0]['repCount']);
                      print(
                          'The rep count of the next exercise is ${nextLastRep[0]['repCount']} ');

                      List<Map<String, dynamic>> previousWeight =
                          await DatabaseHelper.instance.queryLastWeight(
                              workoutData.workoutName,
                              workoutData.exercises[exerciseNumber - 1]);
                      int priorWeight = previousWeight[0]['weight'];
                      print(
                          'The weight of the next exercise is ${previousWeight[0]['weight']}');
                      exerciseModel.setNextlastWeight(priorWeight);

                      List<Map<String, dynamic>> doneOrNot =
                          await DatabaseHelper.instance.queryDoneOrNot(
                              workoutData.workoutName,
                              workoutData.exercises[exerciseNumber - 1]);
                      bool temp1 = (doneOrNot[0]['doneOrNot'] == 0)
                          ? false
                          : true; //Remember bool is not a supported type for SQFlite must use 0 or 1
                      exerciseModel.setNextDoneOrNot(temp1);
                    }

                    setState(() {
                      if (exerciseNumber >= 1) {
                        exerciseNumber--;
                        controller.animateToPage(exerciseNumber,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn);
                        exerciseModel.setExerciseNumber(exerciseNumber);
                      }
                    }); //setState
                  }, //onPressed
                ),
                Container(
                  width: 75,
                  height: 75,
                  child: MaterialButton(
                    onPressed: () async {
                      int i = await DatabaseHelper.instance.insert({
                        //the insert method will always return the internal id of the record(an Integer)
                        DatabaseHelper.columnWorkoutName:
                            workoutData.workoutName,
                        DatabaseHelper.columnExerciseName:
                            workoutData.exercises[exerciseNumber],
                        DatabaseHelper.columnDateTime:
                            DateTime.now().millisecondsSinceEpoch,
                        DatabaseHelper.columnDoneOrNot:
                            (exerciseModel.doneOrNot == false) ? 0 : 1,
                        DatabaseHelper.columnRepCount: exerciseModel.currentRep,
                        DatabaseHelper.columnWeight: exerciseModel
                            .currentWeight, //regardless of the data entered.
                      });
                      setState(() {
                        exerciseModel.setNextLastRep(exerciseModel.currentRep);
                      });

                      // Below is for testing and debugging and not really needed.
                      // print('The inserted id is $i');
                      // List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
                      // print(queryRows);
                      //
                      // List<Map<String,dynamic>> lastRep = await DatabaseHelper.instance.queryLastRep(workoutData.workoutName,workoutData.exercises[exerciseNumber]);
                      // int temp1 = lastRep[0]['repCount'];
                      // print('The rep count in saved is memory for this exercise is ${lastRep[0]['repCount']}');
                      //
                      //
                      // List<Map<String,dynamic>> lastWeight = await DatabaseHelper.instance.queryLastWeight(workoutData.workoutName,workoutData.exercises[exerciseNumber]);
                      // int temp2 = lastWeight[0]['weight'];
                      // print('The weight in saved memory for this exercise is ${lastWeight[0]['weight']}');
                      //
                      //
                      // List<Map<String,dynamic>> doneOrNot = await DatabaseHelper.instance.queryDoneOrNot(workoutData.workoutName,workoutData.exercises[exerciseNumber]);
                      // print('The Done or Not in saved memory for this exercise is ${doneOrNot[0]['doneOrNot']}');
                    },
                    child: Text('Save'),
                    shape: CircleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.red,
                            style: BorderStyle.solid)),
                    color: Colors.blue,
                    textColor: Colors.black,
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orangeAccent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white)),
                    child: Row(
                      children: [
                        Text('Next '),
                        Icon(
                          CupertinoIcons.arrow_right,
                          size: 25.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if (exerciseNumber < workoutData.exercises.length - 1) {
                        List<Map<String, dynamic>> nextLastRep =
                            await DatabaseHelper.instance.queryLastRep(
                                workoutData.workoutName,
                                workoutData.exercises[exerciseNumber + 1]);
                        int test1 = nextLastRep[0]['repCount'];
                        print('The rep count of the next exercise is $test1 ');
                        exerciseModel.setNextLastRep(test1);

                        List<Map<String, dynamic>> nextWeight =
                            await DatabaseHelper.instance.queryLastWeight(
                                workoutData.workoutName,
                                workoutData.exercises[exerciseNumber + 1]);
                        int weight = nextWeight[0]['weight'];
                        print(
                            'The weight of the next exercise is ${nextWeight[0]['weight']}');
                        exerciseModel.setNextlastWeight(weight);

                        List<Map<String, dynamic>> doneOrNot =
                            await DatabaseHelper.instance.queryDoneOrNot(
                                workoutData.workoutName,
                                workoutData.exercises[exerciseNumber + 1]);
                        bool temp3 =
                            (doneOrNot[0]['doneOrNot'] == 0) ? false : true;
                        exerciseModel.setNextDoneOrNot(temp3);
                      }
                      setState(() {
                        if (exerciseNumber < workoutData.exercises.length - 1) {
                          exerciseNumber++;
                          controller.animateToPage(exerciseNumber,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn);
                          exerciseModel.setExerciseNumber(exerciseNumber);
                        }
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ShowCorrectView(String exerciseName) {
    final exerciseModel = context.watch<ExerciseModel>();

    if (fixedRepSets.contains(exerciseName)) {
      return FixedRepPickerView();
    } else if (maxRepSets.contains(exerciseName)) {
      return MaxRepPickerView();
    } else if (doneOrNotSets.contains(exerciseName)) {
      return DoneOrNotPickerView();
    } else {
      return DefaultPickerView();
    }
  }
}
