import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {
  final String exercisetitle;
  final String exerciseImageURL;
  final int noofMinutes;
  final bool isAdded;
  final bool isFav;
  final void Function() toggleAddExercise;
  final void Function() toggleFavExercise;
  
  const AddExerciseCard({
    super.key, 
    required this.exercisetitle, 
    required this.exerciseImageURL, 
    required this.noofMinutes, 
    required this.toggleAddExercise, 
    required this.isAdded, 
    required this.toggleFavExercise, 
    required this.isFav
    }
    );

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kMainCardColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(widget.exercisetitle,style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
            const SizedBox(height: 5),
            Image.asset(
              widget.exerciseImageURL,
               width: 100,
               fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text("${widget.noofMinutes.toString()} of minutes",style: 
            const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: kSubtitleColor
              ),
              ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor.withOpacity(0.2)
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: (){
                        widget.toggleAddExercise();
                      }, 
                      icon: Icon(
                      widget.isAdded? Icons.remove : Icons.add,
                      size: 30,
                      color: kSubBlueColor,
                      )
                      ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor.withOpacity(0.2)
                  ),
                  child: Center(
                    child: IconButton(onPressed: (){
                      widget.toggleFavExercise();
                    }, 
                      icon: Icon(
                      widget.isFav? Icons.favorite :Icons.favorite_border,
                      size: 30,
                      color: kGradientPinkColor,
                      )
                      ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}