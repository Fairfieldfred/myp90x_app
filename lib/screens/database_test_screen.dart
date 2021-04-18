import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/model/workoutData.dart';
import 'package:provider/provider.dart';

class DatabaseTestScreen extends StatefulWidget {

  static const String id = 'database_test_screen';

  @override
  _DatabaseTestScreenState createState() => _DatabaseTestScreenState();
}

class _DatabaseTestScreenState extends State<DatabaseTestScreen> {

  @override
  Widget build(BuildContext context) {
    final exerciseModel = context.watch<ExerciseModel>();
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite Example'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () async {
              int i = await DatabaseHelper.instance.insert({ //the insert method will always return the internal id of the record(an Integer)
                DatabaseHelper.columnWorkoutName: 'Chest and Back',
                DatabaseHelper.columnExerciseName: 'Standards Push ups',
                DatabaseHelper.columnDateTime: DateTime.now().millisecondsSinceEpoch,
                DatabaseHelper.columnDoneOrNot: '',
                DatabaseHelper.columnRepCount: null,
                DatabaseHelper.columnWeight: 0,//regardless of the data entered.
              });
              print('The inserted id is $i');
            },
              child: Text('insert'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
            ),
            TextButton(onPressed: () async {
              List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);
            }, child: Text('query'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green,),
              ),
            ),

            // TextButton(onPressed: () async {
            //   int updatedID = await DatabaseHelper.instance.update({
            //     DatabaseHelper.columnID: 1,
            //     DatabaseHelper.columnWorkoutName : 'Mark'
            //   });
            //   print(updatedID);
            // }, child: Text('update'),
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent,),
            //   ),
            // ),
            // TextButton(onPressed: () async {
            //   int rowsEffected = await DatabaseHelper.instance.delete(1);
            //   print(rowsEffected);
            // }, child: Text('delete'),
            //   style: ButtonStyle(
            //     backgroundColor: MaterialStateProperty.all<Color>(Colors.red,),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}