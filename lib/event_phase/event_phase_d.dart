import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../globals.dart'; // Assuming necessary imports for globals
import 'event_phase_e.dart';

class EventPhaseD extends StatefulWidget {
  const EventPhaseD({Key? key}) : super(key: key);

  @override
  _EventPhaseDState createState() => _EventPhaseDState();
}

class _EventPhaseDState extends State<EventPhaseD> {
  bool queenOrCreeper = false; // Define or import this variable
  bool drawIntruderCard = false; // Define or import this variable
  // Define or import other necessary variables like 'intruderDeck'

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
                padding: EdgeInsets.all(20.0),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Intruder Attack',
                style: GoogleFonts.novaSquare(
                    color: Colors.yellow, fontSize: 40),
              ),
              Container(
                width: 280, // Adjust width as per your requirement
                height: 280, // Adjust height as per your requirement
                child: Image.asset('assets/misc assets/claw.png'),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: 350,
                child: Text(
                  'Draw an Intruder Attack Card for each intruder in a room with a player',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.electrolize(
                    color: Colors.yellow,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    /*
                    if (intruderDeck.cards.isEmpty ||
                        intruderDeck.cards.length == 1) {
                      intruderDeck.reshuffleDiscard();
                    } */
                    if (intruderDeck.cards.isEmpty)
                      {
                        intruderDeck.reshuffleDiscard();
                      }
                    setState(() {
                      drawIntruderCard = true;
                    });
                  },
                  style: getButtonStyle(
                      300, 60, Colors.blue[300]!, 28),
                  child: Text('Draw Intruder Card',
                      style: GoogleFonts.novaSquare())),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventPhaseE()),
                    );
                  },
                  style: getButtonStyle(
                      300, 60, Colors.red[300]!),
                  child: const Text('Next')),
            ],
          ),
        ),
        if (drawIntruderCard) getDrawIntruderCardScreen(),
      ],
    ),
  );

  Widget getDrawIntruderCardScreen() {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
              ),
              Image.asset(intruderDeck.cards[0].picture, width: 330),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              /*
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      queenOrCreeper = true;
                    });
                  },
                  style: getButtonStyle(300, 60, queenOrCreeper ? Colors.grey[700]! : Colors.blue[300]!), //if the button was pressed, grey it out
                  child: const Text('Draw +1')),
              */
              const Padding(
                padding: EdgeInsets.all(15.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    /*
                    if (queenOrCreeper) //discards the second card to the discard pile if the user pressed 'draw +1'
                        {
                      intruderDeck.discardCard(1);
                    } */
                    //discards the first card to the discard pile
                    intruderDeck.discardCard(0);
                    setState(() {
                      queenOrCreeper = false;
                      drawIntruderCard = false;
                    });
                  },
                  style: getButtonStyle(300, 60, Colors.red[300]!),
                  child: const Text('Finish')),
            ],
          ),
        ),
        Align(
          alignment: const Alignment(3, -.35),
          child: queenOrCreeper
              ? Image.asset(intruderDeck.cards[1].picture, width: 330)
              : null,
        ),
      ],
    );
  }
}

