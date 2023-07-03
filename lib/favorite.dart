import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:personalrecipeassistant1/databases/sqflite/database_helper.dart';
import 'package:personalrecipeassistant1/testing.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'favrtcontroller/getfavtprovider.dart';
class Favorite extends StatefulWidget {
  final List<String> favoriteRecipes;
  final List<String> recipename;
  final List<int> numberofcalories;
  final List<String> recipeImage;

  const Favorite({
    Key? key,
    required this.favoriteRecipes,
    required this.recipename,
    required this.numberofcalories,
    required this.recipeImage,
  }) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  Future<void> getFavorites() async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // raw query
    List<Map<String, dynamic>> result =
    await db.rawQuery('SELECT * FROM favourite WHERE userId=?', ['123']);

    setState(() {
      data.addAll(result);
    });
  }

  Future<void> removeFromFavorites(int index) async {
    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // delete the recipe from the database
    await db.delete('favourite',
        where: 'recipename = ? AND userId = ?', whereArgs: [data[index]['recipename'], '123']);

    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Recipes'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final recipeName = data[index]["recipename"];
          final recipeCalories = data[index]["numberofcalories"];
          final recipeImage = data[index]["recipeImage"];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    image: AssetImage(data[index]["recipeImage"]),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["recipename"],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text('Calories: ', style: TextStyle(color: Colors.grey)),
                            Text(
                              data[index]["numberofcalories"],
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => removeFromFavorites(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

