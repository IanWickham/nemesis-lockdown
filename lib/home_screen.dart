import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'event_deck_screen.dart';
import 'setup_screen.dart';

class HomeScreen extends StatelessWidget {
  //class for the home screen
  const HomeScreen({super.key});
//test new commit
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(

        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/box_art2.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 4,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(110.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetupScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          fixedSize: const Size(200, 60),
                          textStyle: const TextStyle(
                              fontSize: 30, color: Colors.black)),
                      child: Text('Start', style: GoogleFonts.novaSquare())
                  ),
                ]
              ),
              ),
            ],
          )
      );
}
/*      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          const TextLayout(),
          Semantics(
            image: true,
            label: 'Nemesis Lockdown Box Art',
            child: Image.asset('assets/box_art.jpg'),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(
            //Row of the first two buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => EventDeckScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(150, 80),
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Event")),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                      fixedSize: const Size(150, 80),
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  child: const Text("Draft")),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(
            //row of the second two buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(150, 80),
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("Attack")),
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    fixedSize: const Size(150, 80),
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  child: const Text("C Actions")),
            ],
          ),
        ],
      ),
    ),


    drawer: Drawer(
      child: Container(
        color: const Color(0xFF5D100A),
        //a very specific dark maroon I found
        child: const Center(
          child: Text("Game Instructions"),
        ),
      ),
    ),*/


class TextLayout extends StatelessWidget {
  //class to format the text of the title
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          //put each RichText block within their own Center widgets to center each line individually
          child: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 50, color: Colors.red[900]),
                  children: <TextSpan>[
            TextSpan(
              text: 'Welcome ',
              style: GoogleFonts.cookie(fontSize: 50), //yay cookies
            ),
            TextSpan(
              text: 'to a',
              style: GoogleFonts.cookie(fontSize: 32),
            ),
          ]))),
      Center(
          //put each RichText block within their own Align widgets to center each line individually
          child: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 50, color: Colors.red[900]),
                  children: <TextSpan>[
            TextSpan(
              text: 'Companion App ',
              style: GoogleFonts.cookie(fontSize: 50),
            ),
            TextSpan(
              text: 'for ',
              style: GoogleFonts.cookie(fontSize: 32),
            ),
                  ]
              )
          )
      ),
    ]);
  }
}
