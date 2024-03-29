import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import 'event_phase_f.dart';



class EventPhaseE extends StatefulWidget {
  const EventPhaseE({super.key});

  @override
  State<EventPhaseE> createState() => _EventPhaseEState();
}

class _EventPhaseEState extends State<EventPhaseE> {
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
                    'Fire Damage',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),



                  Container(
                    width: 330, // Adjust width as per your requirement
                    height: 330, // Adjust height as per your requirement
                    child: Image.asset('assets/misc assets/fire.png'),

                  ),


                  const SizedBox(height: 5.0),

                  Container(
                    width: 350,
                    child: Text(
                      'Each room with a fire marker, deal 1 injury to each intruder and egg',
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
                              builder: (context) => const EventPhaseF()),
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