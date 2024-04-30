import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/event_phase/event_phase_c.dart';
import '../globals.dart';



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
          getTurnCounter(context),

          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                  ),
                  Text(
                    'Move Time Track',
                    style: GoogleFonts.novaSquare(color: Colors.yellow[300], fontSize: 40),
                  ),
                  const SizedBox(height: 20.0),


                  Container(
                    width: 360, // Adjust width as per your requirement
                    height: 300, // Adjust height as per your requirement
                    child: Image.asset('assets/misc assets/timeToken.png'),

                  ),


                  const SizedBox(height: 10.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Advance the time track, and resolve power thresholds',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.yellow[300],
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