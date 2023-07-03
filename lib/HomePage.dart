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

class HomePage extends StatefulWidget {
  final List<String> ?favoriteRecipes;
  // const HomePage(Key? key,) : super(key: key);
  const HomePage({Key? key, this.favoriteRecipes}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xffe94240),
            unselectedItemColor: Colors.black54,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() => _selectedIndex = index);
              if (index == 2) {
                // Camera button pressed
                print('Camera button pressed');
              } else if (index == 4) {
                // Favorites button pressed
              }
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite()))
                      // Home button pressed
                      print('Home button pressed');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home),
                        SizedBox(height: 2),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Empty space to align home button to the left
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
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
                      // Camera button pressed
                      print('Camera button pressed');
                    },
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Empty space to align favorite button to the right
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: 30.0),
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite),
                        SizedBox(height: 2),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
