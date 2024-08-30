import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentImageURL;
  final String equipmentDiscription;
  final int noOfMinuites;
  final double noOfCalaries;
  final bool isAdded;
  final bool isfav;
  final void Function() toggleAddequipment;
  final void Function() toggleAddFavequipment;
  const AddEquipmentCard({
    super.key, 
    required this.equipmentName, 
    required this.equipmentImageURL, 
    required this.equipmentDiscription, 
    required this.noOfMinuites, 
    required this.noOfCalaries, 
    required this.isAdded, 
    required this.toggleAddequipment, 
    required this.isfav, 
    required this.toggleAddFavequipment,
    });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(widget.equipmentName,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
               ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      widget.equipmentImageURL,
                      width: 100,
                      fit: BoxFit.cover,
                 ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:200,
                      child: Text(
                        widget.equipmentDiscription,
                        style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: kSubtitleColor
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Time: ${widget.noOfMinuites.toString()} of minutes",style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kMainBlueColor
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${widget.noOfCalaries.toString()} calories will burned",style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kMainBlueColor
                      ),
                    ),
                  ],
                )
                             ],
                            ),
              ),
            const SizedBox(height: 10),
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
                        widget.toggleAddequipment();
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
                      widget.toggleAddFavequipment();
                    }, 
                      icon: Icon(
                      widget.isfav ? Icons.favorite : Icons.favorite_border,
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