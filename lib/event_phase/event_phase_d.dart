import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/event_phase/event_phase_f.dart';
import '../globals.dart';
import 'event_phase_e.dart';




class EventPhaseD extends StatelessWidget {
  const EventPhaseD({super.key});

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
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Text(
                    'Event Phase',
                    style: GoogleFonts.novaSquare(color: Colors.red, fontSize: 30),
                  ),
                  Text(
                    'Intruder Attack',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 20.0),


                  Container(
                    width: 330, // Adjust width as per your requirement
                    height: 330, // Adjust height as per your requirement
                    child: Image.asset('assets/misc assets/claw.png'),

                  ),


                  const SizedBox(height: 20.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Draw an Intruder Attack Card for each intruder in a room with a player',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.electrolize(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  ElevatedButton(
                      onPressed: () {




                      },
                      style: getButtonStyle(300, 60, Colors.blue[300]!, 28),
                      child: Text('Draw Intruder Card', style: GoogleFonts.novaSquare())
                  ),

                  const SizedBox(height: 20.0),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const EventPhaseE()),
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