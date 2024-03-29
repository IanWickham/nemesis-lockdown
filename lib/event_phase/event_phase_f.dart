import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart';
import '../decks.dart';
import 'event_phase_g.dart';




class EventPhaseF extends StatefulWidget {
  const EventPhaseF({super.key});

  @override
  State<EventPhaseF> createState() => _EventPhaseFState();
}

class _EventPhaseFState extends State<EventPhaseF> {
  late Image img;
  @override
  void initState() {
    super.initState();
    img = Image.network(eventDeck.drawCard());


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
                    'Resolve Event Card',
                    style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 40),
                  ),



                  Container(
                    width: 330, // Adjust width as per your requirement
                    height: 330, // Adjust height as per your requirement
                    child: img,
                  ),


                  const SizedBox(height: 5.0),


                  const SizedBox(height: 30.0),


                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPhaseG()),
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