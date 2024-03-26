import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_number_screen.dart';
import 'globals.dart';

class SetupScreen extends StatelessWidget {
  const SetupScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          getBackground(),
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
                            const TextSpan(
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
                      style: getButtonStyle(300, 60, Colors.red[300]!),
                      child: const Text('Next')
                  ),
                ]
            ),
          ),
        ],
      )
  );
}

