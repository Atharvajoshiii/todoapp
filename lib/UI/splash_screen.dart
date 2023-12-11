import 'package:flutter/material.dart';
import 'package:todoapp/firebase%20services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices().isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 246, 246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image(image: AssetImage('lib/images/logo2.png')),),
            Text("Todo App",style: TextStyle(
              fontSize: 30
            ),),
            SizedBox(height: 10,),
            Text("Make your workflow simple",style: TextStyle(
              fontSize: 20
            ),)
          ],
        ),
      ),
    );
  }
}