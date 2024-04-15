import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/player_phase_start_screen.dart';
import '../globals.dart';
import 'event_phase_f.dart';



class EventPhaseG extends StatefulWidget {
  const EventPhaseG({super.key});

  @override
  State<EventPhaseG> createState() => _EventPhaseGState();
}

class _EventPhaseGState extends State<EventPhaseG> {
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
                    padding: EdgeInsets.all(70.0),
                  ),
                  Text(
                    'Intruder Bag\nDevelopment',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),



                  Container(
                    width: 250, // Adjust width as per your requirement
                    height: 250, // Adjust height as per your requirement
                    //Display Intruder token here

                  ),


                  const SizedBox(height: 5.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Placeholder text, this will change dynamically depending on what token is drawn',
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
                        track=0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseStartScreen()),
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