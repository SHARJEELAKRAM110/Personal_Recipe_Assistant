import 'package:flutter/material.dart';
import 'package:personalrecipeassistant1/databases/sqflite/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'HomePage.dart';
import 'favorite.dart';
class DinnerCard extends StatefulWidget {
  const DinnerCard({Key? key}) : super(key: key);

  @override
  State<DinnerCard> createState() => _DinnerCardState();
}

class _DinnerCardState extends State<DinnerCard> {
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
    'Daal Fry',
    'Palak Paneer',
    'Paneer Bhurji',
    'Tandoori Fish',
    'Chapli Kabab',
    'Aaloo gosht',
    'Beef Biryani',

  ];
  List<int> numberofcalories = [250, 300, 300, 300, 300, 350, 400];
  List<String> recipeImage = [
    'dinner_images/Daal Fry 250.jpg',
    'dinner_images/palak paneer 300.jpg',
    'dinner_images/paneer bhurji 300.jpg',
    'dinner_images/tandoori fish 300.jpg',
    'dinner_images/Chapli Kabab 300.jpg',
    'dinner_images/aaloo gosht 350.jpg',
    'dinner_images/beef biryani 400.jpg',
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
