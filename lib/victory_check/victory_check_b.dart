import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'victory_check_c.dart';

class VictoryCheckB extends StatefulWidget {
  const VictoryCheckB({super.key});

  @override
  State<VictoryCheckB> createState() => _VictoryCheckBState();
}

class _VictoryCheckBState extends State<VictoryCheckB> {
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
                    'Contingency Check',
                    style: GoogleFonts.novaSquare(color: Colors.red, fontSize: 30),
                  ),
                  const SizedBox(height: 160.0),


                  Container(
                    width: 350,
                    child: Text(
                      'Flip the Contingency Token and resolve the effect on survivors',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 80.0),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //goes to next page of victory check if needed or back to main screen
                              builder: (context) => const VictoryCheckC()),
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