import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/data/user_data.dart';
import 'package:workoutplanner/models/equipment_model.dart';
import 'package:workoutplanner/models/exercise_model.dart';
import 'package:workoutplanner/widgets/favourite_card.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  //Date & Time Formatters
  final DateFormat formetter =DateFormat('EEEE,MMMM');
  final DateFormat dayFormat =DateFormat('dd');
  
  //User Data
  final userData = user;

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formatteredDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("$formatteredDate $formattedDay",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kSubtitleColor
                  ),
                  ),
                  Text("Hello,${userData.fullName}",style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor
                  ),
                  ),
                  const SizedBox(height: 10,),
                  const Text("Here are all your favorited Workouts",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: kMainBlueColor,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                     crossAxisSpacing: kDefaultPadding,
                     mainAxisSpacing: kDefaultPadding,
                     childAspectRatio: 15/16
                    ),
                    itemCount: userData.favExerciseList.length, 
                    itemBuilder: (context,index){
                      Exercise favExercise = userData.favExerciseList[index];
                      return FavouriteCard(
                        title: favExercise.exerciseName, 
                        titleImageURL: favExercise.exerciseImageURL, 
                        toggleFavTitle: (){
                          setState(() {
                            if(userData.favExerciseList.contains(favExercise)){
                              userData.removeFavexercise(favExercise);
                            }
                          });
                        }
                        );
                    }
                    ),
                  const SizedBox(height: 20,),
                  const Text("Here are all your favorited Equipment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: kMainBlueColor,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                     crossAxisSpacing: kDefaultPadding,
                     mainAxisSpacing: kDefaultPadding,
                     childAspectRatio: 15/16
                    ),
                    itemCount: userData.favEquipmentList.length, 
                    itemBuilder: (context,index){
                      Equipment favEquipment = userData.favEquipmentList[index];
                      return FavouriteCard(
                        title: favEquipment.equipmentName ,
                        titleImageURL: favEquipment.equipmentImageURL, 
                        toggleFavTitle: (){
                          setState(() {
                            if(userData.favEquipmentList.contains(favEquipment)){
                              userData.removeFavEquipment(favEquipment);
                            }
                          });
                        }
                        );
                    }
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}