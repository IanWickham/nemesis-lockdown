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
  void initState() {
    super.initState();

  }
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
                    'Player Phase',
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  Column( //A second column for the alignment of the text
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '• Draw up to 5',
                          style: GoogleFonts.novaSquare(color: Colors.blue[300], fontSize: 32),
                        ),
                        Text(
                          '  cards in hand',
                          style: GoogleFonts.novaSquare(color: Colors.blue[300], fontSize: 32),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(30.0),
                        ),
                        Text(
                          '• Pass first player',
                          style: GoogleFonts.novaSquare(color: Colors.blue[300], fontSize: 32),
                        ),
                        Text(
                          '  token',
                          style: GoogleFonts.novaSquare(color: Colors.blue[300], fontSize: 32),
                        ),
                      ]
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseMainScreen()),
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
