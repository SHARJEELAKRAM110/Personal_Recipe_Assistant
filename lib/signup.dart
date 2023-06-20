import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:personalrecipeassistant1/login.dart';
import 'package:personalrecipeassistant1/profile_page.dart';
import 'package:personalrecipeassistant1/testing.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool rememberMe = false;
  bool hide=true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController cnfpasswordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE94240),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                  height: 50
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Lato',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 50
              ),
              Container(
                child:Padding(
                  padding: EdgeInsets.only(left:30,right: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(

                        hintText: 'FUll Name',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                            Icons.person
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 15
              ),
              Container(
                child:Padding(
                  padding: EdgeInsets.only(left:30,right: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(

                        hintText: 'Enter your Email',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                            Icons.person
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height: 15
              ),
              Container(
                child:Padding(
                  padding: EdgeInsets.only(left:30,right: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: hide,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                            Icons.lock
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child:Padding(
                  padding: EdgeInsets.only(left:30,right: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: TextFormField(
                      controller: cnfpasswordController,
                      obscureText: hide,
                      decoration: InputDecoration(
                        hintText: 'Confrirm Password',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                            Icons.lock
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                  padding: EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 80,),
                      Flexible(
                          flex: 1,
                          child: TextButton(onPressed: (){}, child: Text('forget password?',style: TextStyle(fontWeight: FontWeight.bold),)))
                    ],
                  )
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  padding: EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      // print("signup clicked");


// Get.to(()=>HomePage());

                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password:passwordController.text.trim());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage( name: nameController.text.trim(),
                            email: emailController.text.trim(),),
                        ),
                      );
                    
                    },
                    child: Text('Sign up', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xffD8D83f)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )),
                        minimumSize: MaterialStateProperty.all(Size.fromHeight(50))
                    ),
                  ),
                ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  'Or',style: TextStyle(fontSize: 25,color: Colors.white),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 80,
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/icons8-google.svg',  // Replace with the path to your Google icon SVG file// Replace with your desired color for the Google icon
                    width:30,
                    height: 30,
                  ),
                  label: Text(
                    'Sign up with Google',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(40)),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 80,
                padding: EdgeInsets.only(top: 20),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'images/cell-phone-svgrepo-com.svg',  // Replace with the path to your Google icon SVG file// Replace with your desired color for the Google icon
                    width:30,
                    height: 30,
                    color: Color(0xffE94240),
                  ),
                  label: Text(
                    'Sign up with Number',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have any account?"),
                        SizedBox(width:10),
                        TextButton(onPressed: (){

                          Get.back();
                        }, child: Text('Signin',textAlign: TextAlign.center,))
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
