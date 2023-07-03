  import 'package:flutter/material.dart';
  import 'package:personalrecipeassistant1/Widgets/recipe_cutom_widget.dart';
  class Recipe extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: RecipeWidget(
              image: ('images/splash.png'),
              title: 'Delicious Recipe',
              description: 'This is a delicious recipe that you will love!',
              calories: '300 kcal',
              ingredients: 'Ingredient 1, Ingredient 2, Ingredient 3',
              isFavorite: false,
              onFavoriteChanged: (isFavorite) {
                // Handle favorite status change
              },
            ),
          ),
      );
    }
  }