import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/models/exercise_model.dart';
import 'package:workoutplanner/widgets/exercise_card.dart';

class ExerciseDetailsPage extends StatefulWidget {
  final String exerciseTitle;
  final String exerciseDisciption;
  final List<Exercise> exerciseList;

  const ExerciseDetailsPage({
    super.key, 
    required this.exerciseTitle, 
    required this.exerciseDisciption, 
    required this.exerciseList
    });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {
  
  //Date & Time Formatters
  final DateFormat formetter =DateFormat('EEEE,MMMM');
  final DateFormat dayFormat =DateFormat('dd');

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formatteredDate = formetter.format(now);
    String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$formatteredDate $formattedDay",style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kSubtitleColor
                ),
                ),
                Text(widget.exerciseTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor
                ),
                ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.exerciseDisciption,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: kSubtitleColor
                ),
              ),
              const SizedBox(height: 20,),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding
                  ),
                  itemCount: widget.exerciseList.length, 
                  itemBuilder: (context, index){
                    Exercise exercise = widget.exerciseList[index];
                    return ExerciseCard(
                      title: exercise.exerciseName, 
                      imageURL: exercise.exerciseImageURL, 
                      discript: "${exercise.numOfMinuites} of workout"
                      );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}