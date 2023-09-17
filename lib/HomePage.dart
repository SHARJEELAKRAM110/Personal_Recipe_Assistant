import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:personalrecipeassistant1/dinner.dart';
import 'package:personalrecipeassistant1/lunch.dart';
import 'package:personalrecipeassistant1/signup.dart';
import 'package:personalrecipeassistant1/testing.dart';
import 'package:personalrecipeassistant1/favorite.dart';
import 'package:personalrecipeassistant1/Widgets/categories_widgets.dart';
import 'package:personalrecipeassistant1/views/camera_view.dart';
import 'package:personalrecipeassistant1/views/scaningScreen.dart';

import 'ObjectDetcte.dart';

class HomePage extends StatefulWidget {
  final List<String> ?favoriteRecipes;
  // const HomePage(Key? key,) : super(key: key);
  const HomePage({Key? key, this.favoriteRecipes}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool colorr=true;
  bool fcolorr=true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 50),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffe94240),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  AppBar(
                    backgroundColor: Color(0xffe94240),
                    elevation: 0,
                    leading: Container(
                      margin: EdgeInsets.only(left: 18.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: Color(0xffe94240),
                        ),
                      ),
                    ),
                    title: Container(
                      margin: EdgeInsets.only(
                          left: 2.0, right: 10.0, top: 8.0, bottom: 8.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for recipes',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Perform image recognition or camera-related actions
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lato',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeCard(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1.0, 1.5),
                                  ),
                                ],
                                color: const Color(0xFFD8d83f),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/breakfast.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Breakfast',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LunchCard(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1.0, 1.5),
                                  ),
                                ],
                                color: const Color(0xFFD8d83f),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/lunch.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Lunch',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DinnerCard(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(1.0, 1.5),
                                  ),
                                ],
                                color: const Color(0xFFD8d83f),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'images/dinner.svg',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Dinner',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,

                child: Card(
                  color: Colors.transparent,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              InkWell(
                                onTap:(){
                                  print("Pressed Home Icon");
                                  setState(() {
                                    colorr=!colorr;
                                  });

                                },
                                  child: Icon(Icons.home,color:colorr? Colors.black.withOpacity(0.5):Colors.red,)),
                              Text('Home',style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffe94240), // Customize the circular background color as needed
                          ),
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {
                              // Get.to(ImageClassificationScreen());
                              // Camera button pressed
                              print('Camera button pressed');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap:(){
                                    print('Favorite icon pressed');
                                    setState(() {
                                      fcolorr=!fcolorr;
                                    });

                                  },
                                  child: Icon(Icons.favorite,color:fcolorr? Colors.black.withOpacity(0.5):Colors.red,)),
                              Text('Favorite',style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
