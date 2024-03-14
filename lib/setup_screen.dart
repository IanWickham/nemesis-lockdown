import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_number_screen.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/texture.jpg'),
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
                  Text(
                    'Setup game like normal,',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  RichText(
                      text: TextSpan(
                          style: GoogleFonts.novaSquare(fontSize: 30),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'EXCEPT ',
                              style: TextStyle(color: Colors.red[300]),
                            ),
                            TextSpan(
                              text: 'for:',
                            ),
                          ]
                      )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(
                    '• Intruder Deck',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Text(
                    '• Event Deck',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Text(
                    '• Computer Deck',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Text(
                    '• Intruder',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    '  Development Bag',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
              ]
                  ),
                  Text(
                    'These will not be used for',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    'the duration of the game.',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerNumberScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          backgroundColor: Colors.red[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(300, 60),
                          textStyle: const TextStyle(
                              fontSize: 30, color: Colors.black)),
                      child: Text('Next', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}

