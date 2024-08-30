import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/data/equipment_data.dart';
import 'package:workoutplanner/data/exercise_data.dart';
import 'package:workoutplanner/data/user_data.dart';
import 'package:workoutplanner/pages/equipment_details_page.dart';
import 'package:workoutplanner/pages/exercise_details_page.dart';
import 'package:workoutplanner/widgets/exercise_card.dart';
import 'package:workoutplanner/widgets/progress_card.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Date & Time Formatters
  final DateFormat formetter =DateFormat('EEEE,MMMM');
  final DateFormat dayFormat =DateFormat('dd');
  
  //User Data
  final userData = user;

  //Exercise and Equipment Data
  final exerciceList = ExerciseData().exerciseList;
  final equipmentList = EquipmentData().equipmentList;

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
                Text("$formatteredDate $formattedDay",style: const TextStyle(
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
                const SizedBox(height: 20,),
                ProgressCard(progreevalue: userData.calculateTotalCaloriesburnrd(), total: 100),
                const SizedBox(height: 20,),
                const Text("Today's Activity",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor
                ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>ExerciseDetailsPage(
                              exerciseTitle: "WarmUp", 
                              exerciseDisciption: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.", 
                              exerciseList:exerciceList, 
                              ),
                            ),
                          );
                      },
                      child: const ExerciseCard(
                        title: "WarmUp", 
                        imageURL: "assets/images/exercise/cobra.png", 
                        discript: "see more..."
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>EquipmentDetailsPage(
                              equipmenttitle: "Equipments", 
                              equipmentdiscript: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.", 
                              equipmentList: equipmentList,
                              )
                              )
                              );
                      },
                      child: const ExerciseCard(
                        title: "Equipment", 
                        imageURL: "assets/images/equipments/dumbbells.png", 
                        discript: "see more..."
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>ExerciseDetailsPage(
                              exerciseTitle: "Exercise", 
                              exerciseDisciption: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.", 
                              exerciseList:exerciceList, 
                              ),
                            ),
                          );
                      },
                      child: const ExerciseCard(
                        title: "Exercise", 
                        imageURL: "assets/images/exercise/dragging.png", 
                        discript: "see more..."
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>ExerciseDetailsPage(
                              exerciseTitle: "Stretching", 
                              exerciseDisciption: "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility visit offers something for every traveler.", 
                              exerciseList:exerciceList, 
                              ),
                            ),
                          );
                      },
                      child: const ExerciseCard(
                        title: "Stretching", 
                        imageURL: "assets/images/exercise/yoga.png", 
                        discript: "see more..."
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ),
      ),
    );
  }
}