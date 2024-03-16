import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart';
import 'player_phase_main_screen.dart';

class PlayerPhaseStartScreen extends StatefulWidget {
  const PlayerPhaseStartScreen({super.key});

  @override
  State<PlayerPhaseStartScreen> createState() => _PlayerPhaseStartScreenState();
}

class _PlayerPhaseStartScreenState extends State<PlayerPhaseStartScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          getBackground(),
          getTurnCounter(),

          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Player Phase',
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseMainScreen()),
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
