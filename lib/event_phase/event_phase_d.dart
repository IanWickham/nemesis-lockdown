import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';




class EventPhaseD extends StatefulWidget {
  const EventPhaseD({super.key});

  @override
  State<EventPhaseD> createState() => _EventPhaseDState();
}

class _EventPhaseDState extends State<EventPhaseD> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          getBackground(),
          getTurnCounter(),

          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Event Phase',
                    style: GoogleFonts.novaSquare(color: Colors.red, fontSize: 30),
                  ),
                  Text(
                    'Intruder Attack',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 280.0),


                  Container(

                  ),




                  Container(
                    width: 350,
                    child: Text(
                      'For every Intruder that is in the same room as a character you must draw an intruder attack',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 60.0),

                  ElevatedButton(
                      onPressed: () {




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
                              fontSize: 28, color: Colors.black)),
                      child: Text('Draw Intruder Card', style: GoogleFonts.novaSquare())
                  ),

                  const SizedBox(height: 20.0),


                  ElevatedButton(
                      onPressed: () {




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
                              fontSize: 28, color: Colors.black)),
                      child: Text('Next', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}