import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_b.dart';



  class EventPhaseA extends StatefulWidget {
  const EventPhaseA({super.key});

  @override
  State<EventPhaseA> createState() => _EventPhaseAState();
}

class _EventPhaseAState extends State<EventPhaseA> {
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
                   Text(
                    'Reveal CSS Pod',
                    style: GoogleFonts.novaSquare(color: Colors.yellow[300], fontSize: 40),
                  ),
                  const SizedBox(height: 20.0),


                  Container(
                    width: 330, // Adjust width as per your requirement
                    height: 250, // Adjust height as per your requirement
                    child: Image.asset('assets/misc assets/css.png'),
                  ),


                  const SizedBox(height: 70.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Reveal current CSS Pod under the time track',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.novaSquare(
                        color: Colors.yellow[300],
                        fontSize: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40.0),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const EventPhaseB()),
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