import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_d.dart';



class EventPhaseC extends StatelessWidget {
  const EventPhaseC({super.key});

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
                    'Noise Removal',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),



                  Container(
                    width: 330, // Adjust width as per your requirement
                    height: 330, // Adjust height as per your requirement
                    child: Image.asset('assets/misc assets/noise.png'),

                  ),


                  //const SizedBox(height: 5.0),

                  Container(
                    width: 350,
                    child: Text(
                      'For sections with power remove noise from all corridors that aren’t adjacent to characters',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30.0),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPhaseD()),
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