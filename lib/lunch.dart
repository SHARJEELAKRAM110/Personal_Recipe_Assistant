import 'package:flutter/material.dart';
import 'package:personalrecipeassistant1/databases/sqflite/database_helper.dart';
import 'package:personalrecipeassistant1/detail_page.dart';
import 'package:sqflite/sqflite.dart';

import 'HomePage.dart';
import 'favorite.dart';
class LunchCard extends StatefulWidget {
  const LunchCard({Key? key}) : super(key: key);

  @override
  State<LunchCard> createState() => _LunchCardState();
}

class _LunchCardState extends State<LunchCard> {
  addFavouritiese(String recipename,String numberofcalories,String recipeImage,) async {

    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

// db.insert("table", {
//   "id":"awais"
// });
    // raw query
    // List<Map> result = await db.rawQuery('SELECT * FROM my_table WHERE name=?', ['Mary']);

    await db.rawInsert('INSERT INTO favourite ("recipename", "numberofcalories","recipeImage","userId") VALUES("$recipename", "$numberofcalories","$recipeImage","123")');
    // print the results
  /*  List<List<String>> ingredients = [
      // Ingredients for each recipe
      ['Ingredient 1', 'Ingredient 2', 'Ingredient 3'],
      ['Ingredient 4', 'Ingredient 5', 'Ingredient 6'],
      // ...
    ];
*/
    // result.forEach((row) => print(row));

    // {_id: 2, name: Mary, age: 32}
  }


  List<String> recipename = [
    'Aalo Palak',
    'Barbeque',
    'Chicken Tikka',
    'Vegetable Biryani',
    'Chicken Karahi',
    'Daal Chawal',
    'Haleem',
    'Biryani',

  ];
  List<int> numberofcalories = [200, 250, 250, 300, 400, 400, 450, 500,];
  List<String> recipeImage = [
    'lunch_images/aalo palak 200.jpg',
    'lunch_images/barbie Que 250.jpg',
    'lunch_images/chicken tikka 250.jpg',
    'lunch_images/vegetable biryani 300.jpg',
    'lunch_images/Chicken Karahi 400.jpg',
    'lunch_images/Daal chawal 400.jpg',
    'lunch_images/Haleem 400.jpg',
    'lunch_images/Biryani 500.jpg'
  ];
  List<String> ingredients = [
    '1',
    '2',
    '3',
    '3',
    '4',
    '5',
    '6',
    '7'
  ];
  List<String> description = [
    '1',
    '2',
    '3',
    '3',
    '4',
    '5',
    '6',
    '7'
  ];

  List<String> favoriteRecipes = []; // List to store favorite recipes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth * 0.8;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: recipename.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(
                              recipeName: recipename[index],
                              numberOfCalories: numberofcalories[index],
                              recipeImage: recipeImage[index],
                             ingredients: ingredients[index],
                             description: description[index],
                              // Replace 'ingredients' with the actual list of ingredients for each item
                            ),
                          ),
                        );
                      },

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image(
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    image: AssetImage(recipeImage[index]),
                                  ),
                                  SizedBox(width: 20), // Adjusted spacing
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recipename[index].toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text('Calories: ', style: TextStyle(color: Colors.grey)),
                                            Text(numberofcalories[index].toString(), style: TextStyle(color: Colors.grey)),
                                            SizedBox(width: 10), // Adjusted spacing
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      width: cardWidth * 0.35, // Adjusted width
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffe94240),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: IconButton(
                                              onPressed: () {
                                                addFavouritiese(recipename[index], numberofcalories[index].toString(), recipeImage[index]);
                                                setState(() {
                                                  if (favoriteRecipes.contains(recipename[index])) {
                                                    favoriteRecipes.remove(recipename[index]);
                                                  } else {
                                                    favoriteRecipes.add(recipename[index]);
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                favoriteRecipes.contains(recipename[index])
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              'Add to Favorite',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favorite(
                        favoriteRecipes: favoriteRecipes,
                        recipename: recipename,
                        numberofcalories: numberofcalories,
                        recipeImage: recipeImage,
                      ),
                    ),
                  );
                },
                child: Text('View Favorites'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Home'),
              ),
            ],
          );
        },
      ),
    );
  }
}
