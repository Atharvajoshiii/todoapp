import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LinearGradient gradient = LinearGradient(
    colors: [Colors.blue, Colors.green], // Example gradient colors
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final _formFeild =
      GlobalKey<FormState>(); // it is initialize to validation of forms
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 550,
              decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(80),
                      topRight: Radius.circular(0),
                      bottomRight: Radius.circular(80))),
              child: Center(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
        
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hi, Welcome Back! 👋",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "We are happy to see you . Login to your account",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                        key: _formFeild,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.black,
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'Enter your Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  filled: true,
                                  fillColor: Colors.black,
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter password';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    child: Container(
                                      height: 50,
                                      width: 350,
                                      child: Center(
                                          child: Text(
                                        "Login",
                                        style: TextStyle(color: Colors.yellow),
                                      )),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                    child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                )),
                decoration: BoxDecoration(
                    color: Colors.yellow, borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 