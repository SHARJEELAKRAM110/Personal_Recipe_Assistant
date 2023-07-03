import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final String recipeName;
  final int numberOfCalories;
  final String recipeImage;
  final String ingredients;
  final String description;

  RecipeDetailPage({
    required this.recipeName,
    required this.numberOfCalories,
    required this.recipeImage,
    required this.ingredients,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(recipeName)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(recipeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffd8d83f),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.fromLTRB(20, 23, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recipe Name: $recipeName',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Number of Calories: $numberOfCalories',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Ingredients:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(ingredients, style: TextStyle(color: Colors.white)),
                SizedBox(height: 16),
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(description, style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
