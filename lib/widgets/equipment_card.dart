import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentImageURL;
  final String equipmentDiscription;
  final int noOfMinuites;
  final double noOfCalaries;
  const EquipmentCard({
    super.key, 
    required this.equipmentName, 
    required this.equipmentImageURL, 
    required this.equipmentDiscription, 
    required this.noOfMinuites, 
    required this.noOfCalaries
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kMainCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(equipmentName,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
               ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    equipmentImageURL,
                    width: 100,
                    fit: BoxFit.cover,
               ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${noOfMinuites.toString()} mins of workout",style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainBlueColor
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${noOfCalaries.toString()} calories will burned",style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainBlueColor
                    ),
                  ),
                ],
              )
             ],
            ),
            const SizedBox(height: 10),
            Text(
               equipmentDiscription,
               style: const TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.normal,
               color: kSubtitleColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}