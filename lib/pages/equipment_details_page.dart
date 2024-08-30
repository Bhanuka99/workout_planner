import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workoutplanner/constants/colors.dart';
import 'package:workoutplanner/constants/responsive.dart';
import 'package:workoutplanner/models/equipment_model.dart';
import 'package:workoutplanner/widgets/equipment_card.dart';

class EquipmentDetailsPage extends StatefulWidget {

  final String equipmenttitle;
  final String equipmentdiscript;
  final List<Equipment> equipmentList;

  const EquipmentDetailsPage({
    super.key, 
    required this.equipmenttitle, 
    required this.equipmentdiscript, 
    required this.equipmentList}
    );

  @override
  State<EquipmentDetailsPage> createState() => _EquipmentDetailsPageState();
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {

  //Date and Time Data
  final DateFormat formatter = DateFormat('EEEE,MMMM');
  final DateFormat dayFormat = DateFormat('dd'); 

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formatteredDate = formatter.format(now);
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
                Text(widget.equipmenttitle,
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
                  widget.equipmentdiscript,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: kSubtitleColor
                  ),
                ),
              const SizedBox(height: 20,),
              //Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:1,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16/10
                ),
                itemCount: widget.equipmentList.length,   
                itemBuilder: (context,index){
                  Equipment equipment =widget.equipmentList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName, 
                    equipmentImageURL: equipment.equipmentImageURL, 
                    equipmentDiscription: equipment.equipmentDiscription, 
                    noOfMinuites: equipment.noOfMinuites, 
                    noOfCalaries: equipment.noOfCalaries,
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