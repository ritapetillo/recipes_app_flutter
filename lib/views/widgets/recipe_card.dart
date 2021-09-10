import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String ratings;
  final String cookTime;
  final String thumbnailUrl;

  RecipeCard({
    required this.title,
    required this.cookTime,
    required this.ratings,
    required this.thumbnailUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
            
            
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(title,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center),
                )
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(children: [
                      Icon(Icons.star, color: Colors.yellow, size: 18,),
                      SizedBox(width: 7,),
                      Text(ratings)
                    ],),

                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(children: [
                      Icon(Icons.timer, color: Colors.yellow, size: 18,),
                      SizedBox(width: 7,),
                      Text(cookTime)
                    ]),
                  )

                ],)
            )
          ],

        ),
        );
  }
}
