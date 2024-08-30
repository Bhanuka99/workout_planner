import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/data/equipment_data.dart';
import 'package:workoutplanner/data/exercise_data.dart';
import 'package:workoutplanner/data/user_data.dart';
import 'package:workoutplanner/models/equipment_model.dart';
import 'package:workoutplanner/models/exercise_model.dart';
import 'package:workoutplanner/widgets/add_equipment_card.dart';
import 'package:workoutplanner/widgets/add_exercise_card.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //User Data
  final userData = user;
  //Exercise list
  final exerciseList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello,${userData.fullName}",style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Lets Add Some Workouts and Equipment for today!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: kMainBlueColor,
                  ),
                ),
                const SizedBox(height: 20),
                const Text("All Exercises",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor
                ),
                ),
                const SizedBox(height: 10),
                //list view to scroll horizontally
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context,index){
                      Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        exercisetitle: exercise.exerciseName, 
                        exerciseImageURL: exercise.exerciseImageURL, 
                        noofMinutes: exercise.numOfMinuites,
                        isAdded: userData.exerciseList.contains(exercise),
                        isFav: userData.favExerciseList.contains(exercise),
                        toggleAddExercise: (){
                          setState(() {
                            if(userData.exerciseList.contains(exercise)){
                              userData.removeExercise(exercise);
                            }else{
                              userData.addExercise(exercise);
                            }
                          });                          
                        },
                        toggleFavExercise: () {
                          setState(() {
                            if(userData.favExerciseList.contains(exercise)){
                              userData.removeFavexercise(exercise);
                            }else{
                              userData.addFavexercise(exercise);
                            }
                          });
                        },
                      );
                    }
                    ),
                ),
                const SizedBox(height: 20),
                const Text("All Equipments",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor
                ),
                ),
                const SizedBox(height: 20),
                //list view to scroll vertically
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: equipmentList.length,
                    itemBuilder: (context,index){
                      Equipment equipment = equipmentList[index];
                      return AddEquipmentCard(
                        equipmentName: equipment.equipmentName, 
                        equipmentImageURL: equipment.equipmentImageURL, 
                        equipmentDiscription: equipment.equipmentDiscription, 
                        noOfMinuites: equipment.noOfMinuites, 
                        noOfCalaries: equipment.noOfCalaries, 
                        isAdded: userData.equipmentList.contains(equipment), 
                        isfav: userData.favEquipmentList.contains(equipment), 
                        toggleAddequipment: (){
                          setState(() {
                            if(userData.equipmentList.contains(equipment)){
                              userData.removeEquipment(equipment);
                            }else{
                              userData.addEquipment(equipment);
                            }
                          });
                        },
                        toggleAddFavequipment: () {
                          setState(() {
                            if(userData.favEquipmentList.contains(equipment)){
                              userData.removeFavEquipment(equipment);
                            }else{
                              userData.addFavEquipment(equipment);
                            }
                          }
                          );
                        },
                        );
                    }
                    ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}