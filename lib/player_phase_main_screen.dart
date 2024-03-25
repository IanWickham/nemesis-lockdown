import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/event_phase/event_phase_a.dart';
import 'event_phase_start_screen.dart';
import 'globals.dart';

class PlayerPhaseMainScreen extends StatefulWidget {
  const PlayerPhaseMainScreen({super.key});

  @override
  State<PlayerPhaseMainScreen> createState() => _PlayerPhaseMainScreenState();
}

class _PlayerPhaseMainScreenState extends State<PlayerPhaseMainScreen> {
  bool covered = false;
  bool prompt = false;
  bool drawIntruderCard = false;
  bool spawnIntruder = false;
  bool queenOrCreeper = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Stack(
            children: <Widget>[
              getBackground(),
              getTurnCounter(),

              Center(
                child: IgnorePointer(
                  ignoring: prompt || (computerActionsDeck.cards[0].name == 'Lock-Down') || drawIntruderCard || spawnIntruder,
                  //Ignore input when the prompt is on the screen
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Player Phase',
                          style: GoogleFonts.novaSquare(
                              color: Colors.blue, fontSize: 30),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                        Container( //Wrap the Material widget for the character selection border
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: prompt ? (Colors.green[300])! : Colors.transparent,
                                width: 5,
                              )
                          ),
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.green[200],
                                onTap: () {
                                  setState(() {
                                    prompt = true;
                                  });
                                },
                                child: Ink.image(
                                  image: AssetImage(computerActionsDeck.cards[0].picture),
                                  height: 350,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(0, 0.5),

                                ),
                              )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                drawIntruderCard = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: Colors.black),
                                backgroundColor: Colors.blue[300],
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: const Size(300, 60),
                                textStyle: const TextStyle(
                                    fontSize: 28, color: Colors.black)),
                            child: Text('Draw Intruder Card',
                                style: GoogleFonts.novaSquare())
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                spawnIntruder = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: Colors.black),
                                backgroundColor: Colors.blue[300],
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: const Size(300, 60),
                                textStyle: const TextStyle(
                                    fontSize: 28, color: Colors.black)),
                            child: Text(
                                'Spawn Intruder',
                                style: GoogleFonts.novaSquare())
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                        ),
                        ElevatedButton(
                        //Moving on to event phase
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EventPhaseA())
                                //^^change this here if you want to see either of^^
                                // Eve's or Tanner's implementation of the Event Phase
                                //Target either EventPhaseStartScreen() or EventPhaseA()
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1, color: Colors.black),
                                backgroundColor: Colors.red[300],
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fixedSize: const Size(300, 60),
                                textStyle: const TextStyle(
                                    fontSize: 28, color: Colors.black)),
                            child: Text('End Player Phase',
                                style: GoogleFonts.novaSquare())
                        ),
                      ]
                  ),
                ),
              ),
              Center( //display CA prompt
                child: prompt ? getCAPrompt() : null,
              ),
              Center( //display Lock-Down prompt
                child: (computerActionsDeck.cards[0].name == 'Lock-Down') ? getLockdownPrompt() : null,
              ),
              Center( //display Lock-Down prompt
                child: drawIntruderCard ? getDrawIntruderCardScreen() : null,
              ),
              Center( //display Lock-Down prompt
                child: spawnIntruder ? getSpawnIntruderScreen() : null,
              ),


            ],
          )
      );
  }
  //Displays the prompt for using and cycling the displayed Computer Action.
  Widget getCAPrompt() {
    return Container(
      height: 400,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey[800]!.withOpacity(0.7),
        border: Border.all(
          width: 2,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Use Computer Action?',
            style: GoogleFonts.novaSquare(
                color: Colors.red[200],
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(60.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      computerActionsDeck.cycleTopCard();
                      prompt = false;
                    });
                    },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          width: 1, color: Colors.black),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(100, 60),
                      textStyle: const TextStyle(
                          fontSize: 30, color: Colors.black)),
                  child: Text('Yes', style: GoogleFonts.novaSquare())
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      prompt = false;
                    });
                    },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          width: 1, color: Colors.black),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(100, 60),
                      textStyle: const TextStyle(
                          fontSize: 30, color: Colors.black)),
                  child: Text('No', style: GoogleFonts.novaSquare())
              ),
            ],
          )
        ],
      ),
    );
  }
  //Displays the prompt for resolving a Lock-Down card once it is drawn.
  Widget getLockdownPrompt() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      Container(
        height: 350,
        width: 300,
        decoration: BoxDecoration(
        color: Colors.grey[800]!.withOpacity(0.9),
        border: Border.all(
          width: 2,
          color: Colors.tealAccent,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Resolve Lock-Down',
            style: GoogleFonts.novaSquare(
                color: Colors.red[600], fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(50.0),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  computerActionsDeck.cycleTopCard();
                });
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(
                      width: 1, color: Colors.black),
                  backgroundColor: Colors.green[400],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(200, 60),
                  textStyle: const TextStyle(
                      fontSize: 30, color: Colors.black)),
              child: Text('Resolved', style: GoogleFonts.novaSquare())
          ),
        ],
      ),
    ),
        const Padding(
          padding: EdgeInsets.all(15.0),
        ),
      ],
    );
  }
  //Displays the Draw Intruder Card Screen
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
                Image.asset(nightStalkerAttackDeck.cards[0].picture, width: 350),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        queenOrCreeper = true;
                      });
                      },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.blue[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black)),
                    child: Text('Draw +1',
                        style: GoogleFonts.novaSquare())
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.blue[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black)),
                    child: Text(
                        'Intruder Retreats',
                        style: GoogleFonts.novaSquare())
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        queenOrCreeper = false;
                        drawIntruderCard = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.red[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                        fixedSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black)),
                    child: Text('Finish',
                        style: GoogleFonts.novaSquare())
                ),
              ]
          ),
        ),
Align(
  alignment: const Alignment(3, -0.5345),
  child: queenOrCreeper ? Image.asset(nightStalkerAttackDeck.cards[1].picture, width: 350) : null,
),
      ]
    );
  }
  //Displays the Spawn Intruder Screen
  Widget getSpawnIntruderScreen() {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.lightGreenAccent,
                            Colors.teal,
                          ],
                          center: Alignment(-0.3, -0.5),
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 20),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Column(
                      children:[
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(15.0),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        )
                      ]
                    )
                  ]
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                ),
                Text(
                  'Spawn Adult',
                  style: GoogleFonts.novaSquare(
                      color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(50.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        drawIntruderCard = true;
                        spawnIntruder = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black)),
                    child: Text('Surprise Attack',
                        style: GoogleFonts.novaSquare())
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        spawnIntruder = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            width: 1, color: Colors.black),
                        backgroundColor: Colors.red[300],
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fixedSize: const Size(300, 60),
                        textStyle: const TextStyle(
                            fontSize: 28, color: Colors.black)),
                    child: Text('Finish',
                        style: GoogleFonts.novaSquare())
                ),
              ]
          ),
        ),
      ],
    );
  }
}

