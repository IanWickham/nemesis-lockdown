import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_c.dart';



class EventPhaseB extends StatelessWidget {
  const EventPhaseB({super.key});

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
                  const SizedBox(height: 80.0),
                  Text(
                    'Move Time Track',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  //const SizedBox(height: 20.0),

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
                      style: getButtonStyle(300, 60, Colors.red[300]!),
                      child: const Text('Next')
                  ),
                ]
            ),
          ),
        ],
      )
  );
}