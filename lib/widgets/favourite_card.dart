import 'package:flutter/material.dart';
import 'package:workoutplanner/constants/colors.dart';

class FavouriteCard extends StatefulWidget {
    final String title;
    final String titleImageURL;
    final void Function() toggleFavTitle;
  const FavouriteCard({
    super.key, 
    required this.title, 
    required this.titleImageURL,  
    required this.toggleFavTitle
    });

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: kMainCardColor,
        child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            widget.title,style: 
            const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Image.asset(
            widget.titleImageURL,
            width: 100,
            fit: BoxFit.cover,
          ),
          IconButton(onPressed: (){
            widget.toggleFavTitle();
          }, 
          icon: const Icon(
            Icons.favorite,
            size: 30,
            color: kGradientPinkColor,
          )
          ),
        ],
      ),
    );
  }
}