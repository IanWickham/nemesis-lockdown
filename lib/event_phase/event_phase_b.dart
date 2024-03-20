import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_c.dart';



class EventPhaseB extends StatefulWidget {
  const EventPhaseB({super.key});

  @override
  State<EventPhaseB> createState() => _EventPhaseBState();
}

class _EventPhaseBState extends State<EventPhaseB> {
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
                    'Move Time Track',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 320.0),


                  Container(

                  ),


                  const SizedBox(height: 70.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Advance the time track, and resolve power thresholds',
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
                          builder: (context) => const EventPhaseC()),
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
                      child: Text('Next', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}