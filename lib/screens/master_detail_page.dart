import 'package:flutter/material.dart';
import 'package:myp90x_app/components/constants.dart';
import 'package:myp90x_app/screens/welcome_screen.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'exercise_screen.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:provider/provider.dart';

class MasterDetailPage extends StatefulWidget {

  static const String id = 'master_Detail_Page';

  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {

  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        final exerciseModel = context.watch<ExerciseModel>();
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(children: <Widget>[
          Expanded(
            child: WorkoutListView()
          ),
          isLargeScreen ? Expanded(child: ExerciseScreen(exerciseModel.currentWorkout)) : Container(),
        ]);
      }),
    );
  }
}


class WorkoutListView extends StatefulWidget {

  @override
  _WorkoutListViewState createState() => _WorkoutListViewState();
}

class _WorkoutListViewState extends State<WorkoutListView> {
  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('My P90X WorkSheet',
            style: kProgramNameTextStyle),
        backgroundColor: Colors.black,
      ),
      body:
      ListView(
        children: [
          for (var i = 0; i < workouts.length; i++ )
            Card(
              color: Colors.blue,
              child: TextButton(
                  child:
                  Row(
                    children: [
                      Card(
                        child: Image(
                          image: AssetImage('images/${workouts[i].workoutName}.png'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(workouts[i].workoutName,
                              maxLines: 2,
                              style: kWorkoutListTextStyle
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){

                    setState(() {
                      exerciseModel.setCurrentWorkout(workouts[i]);
                      print(exerciseModel.currentWorkout.workoutName);
                    });
                  }
              ),
            ),
        ],
        itemExtent: 100.0,
      ),
    );
  }
}



