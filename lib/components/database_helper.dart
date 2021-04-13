import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';

  static final columnID = '_id';
  static final columnWorkoutName = 'workoutName';
  static final columnExerciseName = 'exerciseName';
  static final columnDoneOrNot = 'DoneOrNot';
  static final columnRepCount = 'repCount';
  static final columnWeight = 'weight';
  static final columnDateTime = 'dateTime';

  //First create a singleton class - this is how
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static late Database _database;

  Future<Database> get database async {
      _database = await _initiateDatabase();
      return _database;
    }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory(); //comes from path_provider package
    String path = join(directory.path, _dbName);//join comes form path.dart package
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);

  }

  Future _onCreate(Database db, int version) {
    return db.execute(
      '''
      CREATE TABLE $_tableName (
      $columnID INTEGER PRIMARY KEY, 
      $columnName TEXT NOT NULL )
      '''
      // could use columnWorkoutName, columnExerciseName, columnWeight, ColumnReps, columnDoneOrNot, columnDateTime
      // DateTime needs to be an INT - use flutter now = DateTime.fromMillisecondsSinceEpoch();
    );
  }
  // {
  //  "id":12,
  //  "name": "Fred"
  // }

  Future<int> insert(Map<String,dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String,dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }//could use where: 'workoutName = ?' and 'exerciseName =?', whereArgs: ['$workout.workoutName' and 'exerciseName = workoutName.exerciseName[exerciseNumber]']);

  Future update(Map<String,dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnID];
    return await db.update(_tableName, row, where: '$columnID = ?', whereArgs: [id]);
  }

  Future delete(int id) async {
    Database db = await instance.database;
    return await db.delete(_tableName, where: '$columnID = ?', whereArgs: [id]);
  }

}
