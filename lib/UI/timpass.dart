import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/UI/addtodo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance.reference().child('task');

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
            // Your background decoration code goes here...
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                title: Text(
                  getGreeting(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                actions: [
                  Icon(
                    Icons.logout_sharp,
                    color: Colors.white,
                  )
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      // Your search text field container goes here...
                    ),
                  ),
                  Expanded(
                    child: FirebaseAnimatedList(
                      query: databaseReference,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        final title = snapshot.child('title').value.toString();
                        final day = snapshot.child('day').value.toString();

                        if (searchController.text.isEmpty ||
                            title.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                          return buildListTile(title, day);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTodo()),
                  );
                },
                child: Icon(Icons.add_comment),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListTile(String title, String day) {
    return ListTile(
      tileColor: Colors.grey[200],
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.blue, width: 2.0),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      subtitle: Text(
        day,
        style: TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.blue,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.blue,
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
