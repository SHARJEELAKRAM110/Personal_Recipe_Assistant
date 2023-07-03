import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:personalrecipeassistant1/recipes.dart';
import 'package:personalrecipeassistant1/testing.dart';
import 'package:personalrecipeassistant1/HomePage.dart';
import 'login.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home:SplashScreen(
    ),
  ));

}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  Timer(Duration(seconds: 5),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }
  Widget build(BuildContext context) {

    return SafeArea(
      
 child: Scaffold(
   body: Stack(
     children: [
         Container(
           decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('images/splash.png'),
        fit: BoxFit.cover,
               )
           ),


       ),
       Center(
         child: CircularProgressIndicator(
           color: Color(0xffD8D83F),),
       ),

     ],
   ),
 ),
    );
  }
}

