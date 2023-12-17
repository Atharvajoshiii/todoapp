import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/UI/addtodo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchcontroller = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('task');
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
  void dispose() {
    searchcontroller.dispose();
    super.dispose();
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
                title: Text(
                  getGreeting(),
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
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
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: const Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(.1)),
                      ]),
                      child: TextField(
                        controller: searchcontroller,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff4338CA),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Seacrh here',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: FirebaseAnimatedList(
                          query: ref,
                          itemBuilder: (context, snapshot, animation, index) {
                            final title =
                                snapshot.child('title').value.toString();
                            if (searchcontroller.text.isEmpty) {
                              return ListTile(
                                tileColor: Colors.grey[
                                    200], // Background color of the ListTile
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical:
                                        10.0), // Padding around the content
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15.0), // Rounded corners for the tile
                                  side: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0), // Border for the tile
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors
                                      .blue, // Color of the leading circle avatar
                                  child: Icon(
                                    Icons
                                        .check, // Replace with your desired icon
                                    color: Colors.white, // Icon color
                                  ),
                                ),
                                title: Text(
                                  snapshot.child('title').value.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight
                                        .bold, // Bold text for the title
                                    fontSize: 18.0, // Font size for the title
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.child('day').value.toString(),
                                  style: TextStyle(
                                    fontStyle: FontStyle
                                        .italic, // Italic style for the subtitle
                                    color: Colors
                                        .blue, // Color for the subtitle text
                                  ),
                                ),
                                trailing: Icon(
                                  Icons
                                      .arrow_forward_ios, // Replace with your desired trailing icon
                                  color: Colors.blue, // Trailing icon color
                                ),
                              );
                            } else if (title.toLowerCase().contains(
                                searchcontroller.text
                                    .toLowerCase()
                                    .toLowerCase())) {
                              return ListTile(
                                tileColor: Colors.grey[
                                    200], // Background color of the ListTile
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical:
                                        10.0), // Padding around the content
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15.0), // Rounded corners for the tile
                                  side: BorderSide(
                                      color: Colors.blue,
                                      width: 2.0), // Border for the tile
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: Colors
                                      .blue, // Color of the leading circle avatar
                                  child: Icon(
                                    Icons
                                        .check, // Replace with your desired icon
                                    color: Colors.white, // Icon color
                                  ),
                                ),
                                title: Text(
                                  snapshot.child('title').value.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight
                                        .bold, // Bold text for the title
                                    fontSize: 18.0, // Font size for the title
                                  ),
                                ),
                                subtitle: Text(
                                  snapshot.child('day').value.toString(),
                                  style: TextStyle(
                                    fontStyle: FontStyle
                                        .italic, // Italic style for the subtitle
                                    color: Colors
                                        .blue, // Color for the subtitle text
                                  ),
                                ),
                                trailing: Icon(
                                  Icons
                                      .arrow_forward_ios, // Replace with your desired trailing icon
                                  color: Colors.blue, // Trailing icon color
                                ),
                              );
                              
                            } else {
                              return Container();
                            }
                          })),
                          
                ],
              ),
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddTodo()));
                },
                child: Icon(Icons.add_comment),
              ),
            ),
          )
        ],
      ),
    );
  }
}
