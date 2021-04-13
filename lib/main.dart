import 'package:flutter/material.dart';
import 'package:myp90x_app/screens/database_test_screen.dart';
import 'package:myp90x_app/model/exercise_brain.dart';
import 'package:myp90x_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyP90X());
}

class MyP90X extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ExerciseModel(0),
      child: MaterialApp(
        initialRoute:  WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          DatabaseTestScreen.id: (context) => DatabaseTestScreen(),
        },
      ),
    );
  }
}



