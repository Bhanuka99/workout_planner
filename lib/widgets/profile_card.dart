import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';

class ProfileCard extends StatefulWidget {
  final String taskName;
  final String taskImageURL;
  final void Function() markAsDone;
  const ProfileCard({
    super.key, 
    required this.taskName, 
    required this.taskImageURL, 
    required this.markAsDone
    });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kMainCardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Image.asset(
              widget.taskImageURL,
              width: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10,),
            Text(widget.taskName,style: 
            const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Spacer(),
            IconButton(onPressed: (){
              widget.markAsDone();
            },
             icon: const Icon(
              Icons.check,
              color: kMainBlueColor,
              )
            )
          ],
        ),
      ),
    );
  }
}