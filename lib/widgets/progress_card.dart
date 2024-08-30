import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';

class ProgressCard extends StatefulWidget {

  final double progreevalue;
  final int total;
  const ProgressCard({
    super.key, 
    required this.progreevalue, 
    required this.total
    }
    );

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
    int done =(widget.progreevalue * widget.total).toInt();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
          kMainBlueColor,kGradientDarkBlueColor
        ])
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Proteins, Fats & \nCarbohydrates",style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: kMainWhiteColor
            ),
            ),
            const SizedBox(height: 50,),
            LinearProgressIndicator(
              value: widget.progreevalue,
              backgroundColor: kGradientDarkBlueColor,
              valueColor: const AlwaysStoppedAnimation(kMainWhiteColor),
              minHeight: 8,
              borderRadius: BorderRadius.circular(100),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _builtTag("Done",done.toString()),
                _builtTag("Total",widget.total.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
    Widget _builtTag(String title,String value){
    return Column(
      children: [
        Text(title,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: kMainWhiteColor,
        ),
        ),
        const SizedBox(height: 5,),
        Text(value,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: kMainWhiteColor,
        ),
        ),
      ],
    );
  }
}
