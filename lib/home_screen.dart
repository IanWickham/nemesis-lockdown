import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicScreen extends StatelessWidget {         //class for the home screen
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Nemesis Lockdown'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.edit),
          ),
        ],
      ),

      body: Container (
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
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
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
        color: const Color(0xFF5D100A),         //a very specific dark maroon I found
        child: const Center(
          child: Text("Game Directions"),
        ),
      ),
      ),
    );
  }
}

class TextLayout extends StatelessWidget {      //class to format the text of the title
  const TextLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          Align(        //put each RichText block within their own Align widgets to center each line individually
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 50, color: Colors.red[900]),
                      children: <TextSpan> [
                        TextSpan(
                          text: 'Welcome ',
                          style: GoogleFonts.cookie(fontSize: 50), //yay cookies

                        ),
                        TextSpan(
                          text: 'to a',
                          style: GoogleFonts.cookie(fontSize: 32),
                        ),
                      ]
                  )
              )
          ),
          Align(        //put each RichText block within their own Align widgets to center each line individually
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 50, color: Colors.red[900]),
                      children: <TextSpan> [
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
        ]
    );
  }
}
