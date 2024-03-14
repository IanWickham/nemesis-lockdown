import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    label: _currentSliderValue.round().toString(),
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
                      onPressed: () {},
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
