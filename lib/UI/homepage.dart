import 'package:flutter/material.dart';
import 'package:todoapp/UI/addtodo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchcontroller  = TextEditingController();
  String getGreeting() {
    var timeNow = DateTime.now().hour;
    if (timeNow >= 0 && timeNow < 12) {
      return 'Good morning';
    } else if (timeNow >= 12 && timeNow < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          // Overlay a black gradient on top of the image
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  stops: [0.0, 0.7],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                //centerTitle: true,
                backgroundColor: Colors.transparent,
                title: Text(getGreeting(),style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
                ),),
                actions: [
                  Icon(
                    
                    Icons.logout_sharp ,color: Colors.white,)
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
                        ]),
                        child: TextField(
                         controller: searchcontroller,
                          onChanged: (value) {
                            //Do something wi
                          },
                          decoration:const InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Color(0xff4338CA),),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Seacrh here',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                        ),
                    ),
              ),
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(),
                onPressed: (){
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo()));
                },child: Icon(Icons.add_comment),
              ),
            ),

          )
        ],
      ),
    );
  }
}