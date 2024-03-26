import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'character_draft_screen.dart';
import 'globals.dart';

class PlayerNumberScreen extends StatefulWidget {
  @override
  State<PlayerNumberScreen> createState() => _PlayerNumberScreenState();
}

class _PlayerNumberScreenState extends State<PlayerNumberScreen> {
  double _currentSliderValue = 1;

  //const PlayerNumberScreen({super.key});
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
                    'How many Players are',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    'playing the game?',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  Slider(
                    value: _currentSliderValue,
                    max: 5,
                    min: 1,
                    divisions: 4,
                    //label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    }
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                  ),
                  Text(
                    _currentSliderValue.round().toString(),
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                  ),


                  ElevatedButton(
                      onPressed: () {
                        playerCount = _currentSliderValue.round();            //define the player count
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterDraftScreen()),
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
