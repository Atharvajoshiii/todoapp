import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(

          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hi, Welcome Back! 👋",style: TextStyle(
                  fontSize: 25
                ),),
                
              ],
            ),
            SizedBox(height: 5,),
            Text("We are happy to see you . Login to your account",style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),
    );
  }
}