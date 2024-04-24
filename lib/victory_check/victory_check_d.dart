import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'victory_check_e.dart';

class VictoryCheckD extends StatefulWidget {
  const VictoryCheckD({super.key});

  @override
  State<VictoryCheckD> createState() => _VictoryCheckDState();
}

class _VictoryCheckDState extends State<VictoryCheckD> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          getBackground(),
          getTurnCounter(context),

          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contamination Check',
                    style: GoogleFonts.novaSquare(color: Colors.red, fontSize: 30),
                  ),
                  const SizedBox(height: 160.0),



                  Container(
                    width: 350,
                    child: Text(
                      'Infected Players will now shuffle all of their cards to create a new action deck.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 80.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Draw the top 4 cards, if at least 1 card is contaminated then the character dies.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes to next page of victory check if needed or back to main screen
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
                      child: Text('Next Step', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}