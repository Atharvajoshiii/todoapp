import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Utils/utils.dart';
import 'package:todoapp/auth/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final LinearGradient gradient = LinearGradient(
    colors: [Colors.blue, Colors.green],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formField = GlobalKey<FormState>();
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hi👋 Glad to See You here",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "We are happy to see you. Sign up for your account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),
                    Form(
                      key: _formField,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                                hintText: 'Enter your Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                 
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.black,
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter password';
                                } else if (value.length < 6) {
                                  return 'Write password more than six characters';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 40),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (_formField.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      _auth
                                          .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          )
                                          .then((value) {
                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                                            setState(() {
                                              loading = false;
                                            });
                                            // You can navigate to another screen here on successful signup
                                          })
                                          .catchError((error) {
                                            Utils().toastMessege(error.toString());
                                            setState(() {
                                              loading = false;
                                            });
                                          });
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 350,
                                    child: Center(
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(color: Colors.yellow),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "OR",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Container(
                height: 50,
                width: 200,
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

