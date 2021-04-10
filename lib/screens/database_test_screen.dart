import 'package:flutter/material.dart';
import 'package:myp90x_app/components/database_helper.dart';
import 'package:myp90x_app/model/workoutData.dart';

class DatabaseTestScreen extends StatefulWidget {

  static const String id = 'database_test_screen';

  @override
  _DatabaseTestScreenState createState() => _DatabaseTestScreenState();
}

class _DatabaseTestScreenState extends State<DatabaseTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sqflite Example'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () async {
              int i = await DatabaseHelper.instance.insert({ //the insert method will always return the internal id of the record(an Integer)
                DatabaseHelper.columnName: 'Saheb'           //regardless of the data entered.
              });
              print('The inserted id is $i');
            },
              child: Text('insert'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
            ),
            FlatButton(onPressed: () async {
              List<Map<String,dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);
            }, child: Text('query'), color: Colors.green,),
            FlatButton(onPressed: () async {
              int updatedID = await DatabaseHelper.instance.update({
                DatabaseHelper.columnID: 1,
                DatabaseHelper.columnName : 'Mark'
              });
              print(updatedID);
            }, child: Text('update'), color: Colors.lightBlueAccent,),
            FlatButton(onPressed: () async {
              int rowsEffected = await DatabaseHelper.instance.delete(1);
              print(rowsEffected);
            }, child: Text('delete'), color: Colors.red),
          ],
        ),
      ),
    );
  }
}