import 'package:flutter/material.dart';
import 'package:personalrecipeassistant1/databases/sqflite/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'HomePage.dart';
import 'favorite.dart';
class RecipeCard extends StatefulWidget {
  const RecipeCard({Key? key}) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
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


    // result.forEach((row) => print(row));

    // {_id: 2, name: Mary, age: 32}
  }


  List<String> recipename = [
    'Lassi',
    'Anda Bhurji',
    'Shakshuka',
    'Aalo Pratha',
    'Anda Pratha',
    'Channa Puri',
    'Nehari',
    'Halwapuri'
  ];
  List<int> numberofcalories = [200, 250, 300, 300, 350, 450, 500, 550];
  List<String> recipeImage = [
    'breakfast_images/Lassi.jpg',
    'breakfast_images/anda bhurji.jpg',
    'breakfast_images/shakshuka.jpg',
    'breakfast_images/aalo pratha.jpg',
    'breakfast_images/egg pratha.jpg',
    'breakfast_images/chana pratha.jpg',
    'breakfast_images/nehari.jpg',
    'breakfast_images/halwa puri.jpg'
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
                    return Card(
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
