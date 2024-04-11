import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../event_phase_main_screen.dart';
import '../globals.dart';

class EventPhaseStartScreen extends StatefulWidget {
  const EventPhaseStartScreen({super.key});

  @override
  State<EventPhaseStartScreen> createState() => _EventPhaseStartScreenState();
}

class _EventPhaseStartScreenState extends State<EventPhaseStartScreen> {
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
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 50),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Column( //A second column for the alignment of the text
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //explaining all start of event steps to take so we don't have to make too many screens
                        Text(
                          ' • Move Time Track 1 slot and',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '   resolve steps:',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '    Check for Autodestruction',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '     sequence and Alert Procedure',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '    Check if Power Thresholds',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '     need to be reduced',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                        ),
                        Text(
                          ' • If section has power remove',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '   all Noise markers from',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '   Corridors adjacent to a',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '   vacant Room',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                        ),
                        Text(
                          ' • Do not remove Noise markers',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          '   from Technical Corridors space!',
                          style: GoogleFonts.novaSquare(color: Colors.white, fontSize: 24),
                        ),
                      ]
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventPhaseMainScreen()),
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
