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
                  const SizedBox(height: 30.0),
                   Text(
                    'Reveal CSS Pod',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 30.0),


                  Container(
                    width: 330,
                    height: 330,
                    child: Image.asset('assets/misc assets/css.png'),

                  ),


                  const SizedBox(height: 30.0),

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