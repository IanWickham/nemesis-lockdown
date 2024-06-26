import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';

//sends user back to main screen
import '../home_screen.dart';

class VictoryCheckE extends StatefulWidget {
  const VictoryCheckE({super.key});

  @override
  State<VictoryCheckE> createState() => _VictoryCheckEState();
}

class _VictoryCheckEState extends State<VictoryCheckE> {
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
                    'Mission Failure!',
                    style: GoogleFonts.novaSquare(color: Colors.red, fontSize: 45),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    textAlign: TextAlign.center,
                    'No Survivors survived the horrors of the martian base, All players have lost!',
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