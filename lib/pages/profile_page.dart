import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/data/user_data.dart';
import 'package:workoutplanner/models/equipment_model.dart';
import 'package:workoutplanner/models/exercise_model.dart';
import 'package:workoutplanner/widgets/profile_card.dart';
import 'package:workoutplanner/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
                  const SizedBox(height: 10,),
                  const Text("Your progress",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ProgressCard(progreevalue: userData.calculateTotalCaloriesburnrd(), total: 100),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kMainCardColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding*1.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total minutes to Spend: ${userData.calculateTotalSpendTime().toString()}",style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: kMainBlueColor
                            ),
                          ),
                          const SizedBox(height: 13,),
                          Text(
                            "Total Exercises Completed: ${userData.totalExerciseCompleted}",
                            style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kMainBlackColor
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Total Equipments Handovered: ${userData.totalEquipmentshHandovered}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kMainBlackColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Your Exercises",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor
                    ),
                  ),
                  const SizedBox(height: 15,),

                  //Exercise list of the user
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userData.exerciseList.length,
                    itemBuilder: (context, index) {
                    Exercise userExercise = userData.exerciseList[index];
                    return ProfileCard(
                      taskName: userExercise.exerciseName, 
                      taskImageURL: userExercise.exerciseImageURL, 
                      markAsDone: (){
                        setState(() {
                          userData.markExerciseAsCompleted(userExercise.id);
                        });
                      }
                      );
                  },
                  ),
                  const Text("Your Equipments",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor
                    ),
                  ),
                  const SizedBox(height: 15,),

                  //Exercise list of the user
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: userData.equipmentList.length,
                    itemBuilder: (context, index) {
                    Equipment userEquipment = userData.equipmentList[index];
                    return ProfileCard(
                      taskName: userEquipment.equipmentName, 
                      taskImageURL: userEquipment.equipmentImageURL, 
                      markAsDone: (){
                        setState(() {
                          userData.markEquipmentAsHandovered(userEquipment.id);
                        });
                      }
                      );
                  },
                  )
                  
              ],
            
            ),
          )
        ),
      ),
    );
  }
}