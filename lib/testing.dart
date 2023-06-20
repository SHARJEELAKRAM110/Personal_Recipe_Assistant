import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();

}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:Center(child: GestureDetector(
    onTap: (){
 FirebaseAuth.instance.createUserWithEmailAndPassword(email: "abc@gmail.com", password:"123456");
 print("registered compilation");

 },
    child: Text("Welcome to home page",style: TextStyle(color: Colors.red,fontSize: 50,fontWeight: FontWeight.bold),)),)
    );
  }
}
