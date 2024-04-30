import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

//sends user back to main screen
import '../home_screen.dart';

class VictoryCheckWin extends StatefulWidget {
  const VictoryCheckWin({super.key});

  @override
  State<VictoryCheckWin> createState() => _VictoryCheckWinState();
}

class _VictoryCheckWinState extends State<VictoryCheckWin> {
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
                    'Mission Success!',
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 45),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    textAlign: TextAlign.center,
                    'The players whose Survivors have lived to see another day, win the game!',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 28),
                  ),
                  const SizedBox(height: 60.0),




                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes back to main/start screen
                              builder: (context) => const HomeScreen()),
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
                      child: Text('End Game', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}