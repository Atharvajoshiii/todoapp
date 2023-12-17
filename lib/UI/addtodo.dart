import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/UI/homepage.dart';
import 'package:todoapp/Utils/utils.dart';
import 'package:todoapp/widgets/glowingbutton.dart';
import 'package:todoapp/widgets/textarea.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final textcontroller = TextEditingController();
  final databaseref = FirebaseDatabase.instance.ref('task');

  String getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
       return '';
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image with Gradient Effect
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/forest.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.blue.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 20),
                Text(
                  "Add Your Task",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PrimaryContainer(
                    radius: 10,
                    child: TextField(
                      onChanged: (value) {},
                      maxLines: 6,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                      controller: textcontroller,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 10),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Text Here',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed:(){

                    String id = DateTime.now().millisecondsSinceEpoch.toString();
                    String currentday = getDayOfWeek(DateTime.now());

                    databaseref.child(id).set({
                      'title':textcontroller.text.toString(),
                      'id':id,
                      'day': currentday,
                    }).then((value){
                      Utils().toastMessege('task added');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));


                    }).onError((error, stackTrace){
                      Utils().toastMessege(error.toString());
                    });

                  } ,
                   child: Text("Add Text"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
