import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/victory_check/victory_check_win.dart';
import '../globals.dart';
import 'victory_check_b.dart';
import 'victory_check_lose.dart';

class VictoryCheckF extends StatefulWidget {
  const VictoryCheckF({super.key});

  @override
  State<VictoryCheckF> createState() => _VictoryCheckFState();
}

class _VictoryCheckFState extends State<VictoryCheckF> {
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
                    'Victory Check',
                    style: GoogleFonts.novaSquare(color: Colors.yellow[300], fontSize: 38),
                  ),
                  const SizedBox(height: 120.0),




                  Text(
                    'Are any Characters Still alive?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 32),
                  ),
                  const SizedBox(height: 80.0),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes to next page of victory check if needed or back to main screen
                              builder: (context) => const VictoryCheckWin()),
                        );

                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          backgroundColor: Colors.blue[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(300, 60),
                          textStyle: const TextStyle(
                              fontSize: 30, color: Colors.black)),
                      child: Text('Yes', style: GoogleFonts.novaSquare())
                  ),

                  const SizedBox(height: 30.0),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes end screen
                              builder: (context) => const VictoryCheckE()),
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
                      child: Text('No', style: GoogleFonts.novaSquare())
                  ),
                  const SizedBox(height: 100.0),
                ]
            ),
          ),
        ],
      )
  );
}