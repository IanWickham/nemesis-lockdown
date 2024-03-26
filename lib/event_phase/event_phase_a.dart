import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_b.dart';



  class EventPhaseA extends StatelessWidget {
  const EventPhaseA({super.key});

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
                    'Reveal CSS Pod',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 160.0),


                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    child: Center(
                        child: Text(
                        'CSS',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 50),
                    // Child widget to center text under the graphic
                  ),
                    ),
                  ),


                  const SizedBox(height: 70.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Reveal current CSS Pod under the time track',
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
                            builder: (context) => const EventPhaseB()),
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