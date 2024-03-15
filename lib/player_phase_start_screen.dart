import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PlayerPhaseStartScreen extends StatelessWidget {
  const PlayerPhaseStartScreen({super.key});

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
                    'Player Phase',
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Draw up to 5',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          '  cards in hand',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                        ),
                        Text(
                          '• Pass first player',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                        ),
                        Text(
                          '  token',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                      ]
                  ),

                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),

                  ElevatedButton(
                      onPressed: () {

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
