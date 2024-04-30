import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'victory_check_d.dart';

class VictoryCheckC extends StatefulWidget {
  const VictoryCheckC({super.key});

  @override
  State<VictoryCheckC> createState() => _VictoryCheckCState();
}

class _VictoryCheckCState extends State<VictoryCheckC> {
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
                    'Contamination Check',
                    style: GoogleFonts.novaSquare(color: Colors.yellow[300], fontSize: 36),
                  ),

                  const SizedBox(height: 60.0),

                  Container(
                    width: 350,
                    child: Text(
                      '• Each living character checks their contamination cards',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  Container(
                    width: 350,
                    child: Text(
                      '• Scan all cards in their action deck if at least 1 reads infected follow the next step.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  Container(
                    width: 350,
                    child: Text(
                      '(If player already has larva on their character board, ignore this step and move to the next one.)',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),


                  const SizedBox(height: 50.0),

                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes to next page of victory check if needed or back to main screen
                              builder: (context) => const VictoryCheckD()),
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