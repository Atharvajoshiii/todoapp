import 'package:flutter/material.dart';
import 'package:todoapp/UI/homepage.dart';

class GlowingButton extends StatefulWidget {
  const GlowingButton({Key? key}) : super(key: key);
  @override
  GlowingButtonState createState() => GlowingButtonState();
}

class GlowingButtonState extends State<GlowingButton> {
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));





      },
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onHover: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.blue,
              ],
            ),
            boxShadow: glowing
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.6),
                      spreadRadius: 1,
                      blurRadius: 16,
                      offset: const Offset(8, 0),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 16,
                      blurRadius: 32,
                      offset: const Offset(8, 0),
                    )
                  ]
                : []),
        child: Text(
          glowing ? "Add" : "Add",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}