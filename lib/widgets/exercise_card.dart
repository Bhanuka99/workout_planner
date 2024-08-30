import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String imageURL;
  final String discript;
  const ExerciseCard({
    super.key, 
    required this.title, 
    required this.imageURL, 
    required this.discript
    }
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: kMainCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(title,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              imageURL,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(discript,style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: kMainBlueColor
            ),
            ),
          ],
        ),
      ),
    );
  }
}