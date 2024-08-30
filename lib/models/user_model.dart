import 'package:workoutplanner/models/equipment_model.dart';
import 'package:workoutplanner/models/exercise_model.dart';

class User{
  final String userId; 
  final String fullName; 
  final String gender; 
  final String address;
  final int age;
  final String discription;
  int totalExerciseCompleted = 0; 
  int totalEquipmentshHandovered = 0;

  final List <Exercise> exerciseList; 
  final List <Equipment> equipmentList;

  final List <Exercise> favExerciseList; 
  final List <Equipment> favEquipmentList;

  User({
    required this.userId, 
    required this.fullName, 
    required this.gender, 
    required this.address, 
    required this.age, 
    required this.discription, 
    required this.exerciseList, 
    required this.equipmentList, 
    required this.favExerciseList, 
    required this.favEquipmentList
    }
    );
  //Methods
  //Methods to add new exercise to the ExerciseList
  void addExercise(Exercise exercise){
    exerciseList.add(exercise);
  }
  //Methods to remove a exercise from the ExerciseList
  void removeExercise(Exercise exercise){
    exerciseList.remove(exercise);
  }
  //Methods to add a exercise to the favExerciseList
  void addFavexercise(Exercise exercise){
    favExerciseList.add(exercise);
  }
  //Methods to remove a exercise from the favExerciseList
  void removeFavexercise(Exercise exercise){
    favExerciseList.remove(exercise);
  }
  //Methods to add new Equipment to the EquipmentListList
  void addEquipment(Equipment equipment){
    equipmentList.add(equipment);
  }
  //Methods to remove a Equipment from the EquipmentList
  void removeEquipment(Equipment equipment){
    equipmentList.remove(equipment);
  }
  //Methods to add new Equipment to the FavEquipmentList
  void addFavEquipment(Equipment equipment){
    favEquipmentList.add(equipment);
  }
  //Methods to remove a favorite equipment from the FavEquipmentList
  void removeFavEquipment(Equipment equipment){
    favEquipmentList.remove(equipment);
  }
  //Method for total minutes spend
  int calculateTotalSpendTime(){
    int totalMinutesSpend =0;

    //loop through the exerciseList and calculate num of minutes
    for( var exercise in exerciseList){
      totalMinutesSpend += exercise.numOfMinuites;
    }
    //loop through the equipmentList and calculate num of minutes
    for( var equipment in equipmentList){
      totalMinutesSpend += equipment.noOfMinuites;
    }
    return totalMinutesSpend;
  }
  //Method to mark exercise as completed
  void markExerciseAsCompleted(int exerciseID){
    final exercise = exerciseList.firstWhere((exercise)=>exercise.id == exerciseID);

    exercise.isCompleted=true;
    //Remove from the exercise list
    removeExercise(exercise);

    totalExerciseCompleted++;
  }
  //Method to mark equipment as handovered
  void markEquipmentAsHandovered(int equipmentId){
    final equipment = equipmentList.firstWhere((equipment) =>equipment.id == equipmentId);

    equipment.isHandover = true;
    //Remove from the equipment list
    removeEquipment(equipment);

    totalEquipmentshHandovered++;

  }
  //Methods to calculate the total number of calories burned by the user

  double calculateTotalCaloriesburnrd(){
    double totalCaloriesBurned = 0;

    for(var equipment in equipmentList){
      totalCaloriesBurned += equipment.noOfCalaries;
    }
    //convert the totalCaloriesBurned in to value between 0 and 1
    if(totalCaloriesBurned > 0 && totalCaloriesBurned <10){
      totalCaloriesBurned = totalCaloriesBurned/10;
    }
    if(totalCaloriesBurned > 10 && totalCaloriesBurned <100){
      totalCaloriesBurned = totalCaloriesBurned/100;
    }
    if(totalCaloriesBurned > 100 && totalCaloriesBurned <1000){
      totalCaloriesBurned = totalCaloriesBurned/1000;
    }
    return totalCaloriesBurned;
  }
}