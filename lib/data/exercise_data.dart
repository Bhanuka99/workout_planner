import 'package:workoutplanner/models/exercise_model.dart';

class ExerciseData {
final  List <Exercise> exerciseList = [
    Exercise(
      id: 0, 
      exerciseName: "Push-Ups", 
      exerciseImageURL: "assets/images/exercise/downward-facing.png", 
      numOfMinuites: 10, 
      isCompleted: false,
      ),
      Exercise(
      id: 1,
      exerciseName: "Squats",
      exerciseImageURL: "assets/images/exercise/weightlifting.png",
      numOfMinuites: 20,
      isCompleted: false,
    ),
    Exercise(
      id: 2,
      exerciseName: "Plank",
      exerciseImageURL: "assets/images/exercise/dragging.png",
      numOfMinuites: 30,
      isCompleted: false,
    ),
    Exercise(
      id: 3,
      exerciseName: "Jumping Jacks",
      exerciseImageURL: "assets/images/exercise/hunch_back.png",
      numOfMinuites: 10,
      isCompleted: false,
    ),
    Exercise(
      id: 4,
      exerciseName: "Crunches",
      exerciseImageURL: "assets/images/exercise/treadmill-machine_men.png",
      numOfMinuites: 15,
      isCompleted: false,
    ),
    Exercise(
      id: 5,
      exerciseName: "Lunges",
      exerciseImageURL: "assets/images/exercise/treadmill-machine_women.png",
      numOfMinuites: 20,
      isCompleted: false,
    ),
    Exercise(
      id: 6,
      exerciseName: "Burpees",
      exerciseImageURL: "assets/images/exercise/triangle.png",
      numOfMinuites: 25,
      isCompleted: false,
    ),
    Exercise(
      id: 7,
      exerciseName: "High Knees",
      exerciseImageURL: "assets/images/exercise/weightlifting.png",
      numOfMinuites: 10,
      isCompleted: false,
    ),
    Exercise(
      id: 8,
      exerciseName: "Bicycle Crunches",
      exerciseImageURL: "assets/images/exercise/yoga.png",
      numOfMinuites: 20,
      isCompleted: false,
    ),
    Exercise(
      id: 9,
      exerciseName: "Leg Raises",
      exerciseImageURL: "assets/images/exercise/triangle.png",
      numOfMinuites: 15,
      isCompleted: false,
    ),
  ];
}