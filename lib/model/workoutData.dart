import 'dart:collection';

import 'package:flutter/material.dart';

class WorkoutData extends StatelessWidget {

  WorkoutData({required this.workoutName, required this.imageName, required this.description, required this.exercises});

  final String workoutName;
  final String imageName;
  final String description;
  final List exercises;


  @override
  Widget build(BuildContext context) {
    return Container();
  }

}

List <dynamic> workouts = [
  WorkoutData(workoutName: 'Chest and Back', imageName: 'Chest and Back', description: 'Pushing and pulling as simple as it gets.', exercises: chestAndBackExercises),
  WorkoutData(workoutName: 'Shoulders and Arms', imageName: 'Shoulders and Arms', description: "It's the glamour routine.", exercises: shouldersAndArmsExercises),
  WorkoutData(workoutName: 'Legs and Back', imageName: 'Legs and Back', description: 'People ask...How do you get legs like that?', exercises: legsAndBackExercises),
  WorkoutData(workoutName: 'Chest, Shoulders, and Triceps', imageName: 'Chest, Shoulders, and Triceps', description: 'Good old fashion weightlifting 101.', exercises: chestShouldersTricepsExercises),
  WorkoutData(workoutName: 'Back and Biceps', imageName: 'Back and Biceps', description: 'An hour of pull ups, chin ups, and curls!', exercises: backAndBicepExercises),
  WorkoutData(workoutName: 'Core Synergistics', imageName: 'Core Synergistics', description: 'Combine resistance, cardio, and balance training.', exercises: coreSynergisticExercises),
];

Set fixedRepSets = {
'Static Arm Curls','Static Arm Curls 2',
'In & Out Bicep Curls','In & Out Bicep Curls 2',
'Calf Raises','Balance Lunges',
'Calf Raise Squats',
'Super Skaters', 'Step Back Lunges',
'Alternating Side Lunges',
'Dead Lift Squats',
'Three-Way Lunges','Toe Roll Iso Lunges',
'80-20 Siebers Speed Squats',
'Twenty-Ones',
'Congdon Locomotives',
'Strip-Set Curls',
'Weighted Circles',
'Seated Two-Angle Shoulder Flys','Seated Two-Angle Shoulder Flys 2',
'In & Out Straight-Arm Shoulder Flys', 'In & Out Straight-Arm Shoulder Flys 2',
'Lunge Kickback Curl Press',
'Squat Run'
};

Set doneOrNotSets = {
  'Superman', 'Superman Banana',
  'Groucho Walk',
  'Chair Salutations',
  'Sneaky Lunge',
  'Three-Way Lunges',
  'Dead Lift Squats',
  'Single Leg Wall Squats',
  'Wall Squat',
  'Banana Roll',
  'Bow to Boat',
  'Low Lateral Skaters',
  'Towel Hoppers',
  'Steam Engine',
  'Plank to Chataranga Iso',
  'Plank to Chataranga Run',
  'Halfback',
};

Set maxRepSets = {
  'Standard Push-Ups', 'Standard Push-Ups 2',
  'Wide Front Pull-Ups', 'Wide Front Pull-Ups 2',
  'Military Push-Ups', 'Military Push-Ups 2',
  'Reverse Grip Chin-Ups', 'Reverse Grip Chin-Ups 2',
  'Wide Fly Push-Ups', 'Wide Fly Push-Ups 2',
  'Close Grip Overhand Pull-Ups', 'Close Grip Overhand Pull-Ups 2',
  'Decline Push-Ups', 'Decline Push-Ups 2',
  'Diamond Push-Ups', 'Diamond Push-Ups 2',
  'Dive-Bomber Push-Ups', 'Dive-Bomber Push-Ups 2',
  'Chair Dips', 'Chair Dips 2',
  'Side Tri-Rises', 'Side Tri-Rises 2',
  'Switch Grip Pull-Ups', 'Switch Grip Chin-Ups 2',
  'Slow-Motion 3 in 1 Push-Ups',
  'Plange Push-Ups',
  'Pike Presses',
  'Floor Flys',
  'Two-Twitch Speed Push-Ups',
  'Side-to-Side Push-Ups',
  'One-Arm Push-Ups',
  'Clap or Plyo Push-ups',
  'One-Arm Balance Push-Ups',
  'Corn-Cob Pull-Ups',
  'Towel Pull-Ups',
  'Max rep Pull-Ups',
  'Stacked Foot/Staggered Hands Push-Ups',
  'Sphinx Push-Up',
  'Prison Cell Push-Up',
  'Walking Push-Up',
  'Reach High & Under Push-Ups',
  'Side Hip RIse',
  'The Dreya Roll'
};

const coreSynergisticExercises = [
  'Stacked Foot/Staggered Hands Push-Ups',
  'Banana Roll',
  'Leaning Crescent Lunges',
  'Squat Run',
  'Sphinx Push-Up',
  'Bow to Boat',
  'Low Lateral Skaters',
  'Lunge & Reach',
  'Prison Cell Push-Up',
  'Side Hip RIse',
  'Squat X-Press',
  'Plank to Chataranga Run',
  'Walking Push-Up',
  'Superman Banana',
  'Lunge Kickback Curl Press',
  'Towel Hoppers',
  'Reach High & Under Push-Ups',
  'Steam Engine',
  'The Dreya Roll',
  'Plank to Chataranga Iso',
  'Halfback',
  'Table Dip Leg Raise'
];

const chestAndBackExercises = [
  'Standard Push-Ups',
  'Wide Front Pull-Ups',
  'Military Push-Ups',
  'Reverse Grip Chin-Ups',
  'Wide Fly Push-Ups',
  'Close Grip Overhand Pull-Ups',
  'Decline Push-Ups',
  'Heavy Pants',
  'Diamond Push-Ups',
  'Lawnmowers',
  'Dive-Bomber Push-Ups',
  'Back Flys',
  'Wide Front Pull-Ups 2',
  'Standard Push-Ups 2',
  'Reverse Grip Chin-Ups 2',
  'Military Push-Ups 2',
  'Close Grip Overhand Pull-Ups 2',
  'Wide Fly Push-Ups 2',
  'Heavy Pants 2',
  'Decline Push-Ups 2',
  'Lawnmowers 2',
  'Diamond Push-Ups 2',
  'Back Flys 2',
  'Dive-Bomber Push-Ups 2'
];

const shouldersAndArmsExercises = [
  'Alternating Shoulder press',
  'In & Out Bicep Curls',
  'Two-Arm Tricep Kickbacks',
  'Alternating Shoulder press 2',
  'In & Out Bicep Curls 2',
  'Two-Arm Tricep Kickbacks 2',
  "Deep Swimmer's Presses",
  'Full Supination Concentration Curls',
  'Chair Dips',
  "Deep Swimmer's Presses 2",
  'Full Supination Concentration Curls 2',
  'Chair Dips 2',
  'Upright Rows',
  'Static Arm Curls',
  'Flip-Grip Twist Tricep KickBacks',
  'Upright Rows 2',
  'Static Arm Curls 2',
  'Flip-Grip Twist Tricep KickBacks 2',
  'Seated Two-Angle Shoulder Flys',
  'Crouching Cohan Curls',
  'Lying Down Tricep Extension',
  'Seated Two-Angle Shoulder Flys 2',
  'Crouching Cohan Curls 2',
  'Lying Down Tricep Extension 2',
  'In & Out Straight-Arm Shoulder Flys',
  'Congdon Curls',
  'Side Tri-Rises',
  'In & Out Straight-Arm Shoulder Flys 2',
  'Congdon Curls 2',
  'Side Tri-Rises 2',
];

const legsAndBackExercises = [
  'Balance Lunges',
  'Calf Raise Squats',
  'Reverse Grip Chin-Ups',
  'Super Skaters',
  'Wall Squat',
  'Wide Front Pull-Ups',
  'Step Back Lunges',
  'Alternating Side Lunges',
  'Close Grip Overhand Pull-Ups',
  'Single Leg Wall Squats',
  'Dead Lift Squats',
  'Switch Grip Pull-Ups',
  'Three-Way Lunges',
  'Sneaky Lunge',
  'Reverse Grip Chin-Ups 2',
  'Chair Salutations',
  'Toe Roll Iso Lunges',
  'Wide Front Pull-Ups 2',
  'Groucho Walk',
  'Calf Raises',
  'Close Grip Overhand Pull-Ups 2',
  '80-20 Siebers Speed Squats',
  'Switch Grip Chin-Ups 2'
];

const chestShouldersTricepsExercises = [
  'Slow-Motion 3 in 1 Push-Ups',
  'In & Out Shoulder Flys',
  'Chair Dips',
  'Plange Push-Ups',
  'Pike Presses',
  'Side Tri-Rises',
  'Floor Flys',
  'Scarecrows',
  'Overhead Tricep Extensions',
  'Two-Twitch Speed Push-Ups',
  'Y-Presses',
  'Lying Tricep Extensions',
  'Side-to-Side Push-Ups',
  'Pour Flys',
  'Side-Leaning Tricep Extensions',
  'One-Arm Push-Ups',
  'Weighted Circles',
  'Throw the Bomb',
  'Clap or Plyo Push-ups',
  'Slo-Mo Throws',
  'Front-to-Back Tricep Extensions',
  'One-Arm Balance Push-Ups',
  'Fly-Row Presses',
  'Dumbbell Cross-Body Blows',
];

const backAndBicepExercises = [
  'Wide Front Pull-Ups',
  'Lawnmowers',
  'Twenty-Ones',
  'One-Arm Cross Body Curls',
  'Switch Grip Pull-Ups',
  'Elbow-Out Lawnmowers',
  'Standing Bicep Curls',
  'One-Arm Concentration Curls',
  'Corn-Cob Pull-Ups',
  'Reverse Grip Bent-Over Rows',
  'Open Arm Curls',
  'Static Arm Curls',
  'Towel Pull-Ups',
  'Congdon Locomotives',
  'Crouching Cohan Curls',
  'CorkScrew Curls',
  'Reverse Grip Chin-Ups',
  'Seated Bent-Over Back Flys',
  'Curl-Up / Hammer-Downs',
  'Hammer Curls',
  'Max rep Pull-Ups',
  'Superman',
  'In-Out hammer Curls',
  'Strip-Set Curls',
];
