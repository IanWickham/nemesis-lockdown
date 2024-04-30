import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'victory_check_b.dart';
import 'victory_check_e.dart';

class VictoryCheckA extends StatefulWidget {
  const VictoryCheckA({super.key});

  @override
  State<VictoryCheckA> createState() => _VictoryCheckAState();
}

class _VictoryCheckAState extends State<VictoryCheckA> {
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
                    'Did any Characters Survive?',
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
                              builder: (context) => const VictoryCheckB()),
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