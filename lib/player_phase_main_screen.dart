import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/event_phase/event_phase_a.dart';
import 'unused screens/event_phase_start_screen.dart';
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
  bool intruderRetreats = false;
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
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Container( //Wrap the Material widget for the selection border

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

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                child: Ink.image(
                                  image: AssetImage(computerActionsDeck.cards[0].picture),
                                  height: 350,
                                  fit: BoxFit.cover,
                                  alignment: const Alignment(0, 0.7),
                                ),
                                ),
                              )
                          ),
                        ),
                        ),

                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                drawIntruderCard = true;
                              });
                            },
                            style: getButtonStyle(300, 60, Colors.blue[300]!, 28),
                            child: const Text('Draw Intruder Card')
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
                            style: getButtonStyle(300, 60, Colors.blue[300]!),
                            child: const Text('Spawn Intruder')
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
                            style: getButtonStyle(300, 60, Colors.red[300]!),
                            child: const Text('End Player Phase')
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
              Center( //display draw intruder card screen
                child: drawIntruderCard ? getDrawIntruderCardScreen() : null,
              ),
              Center( //display spawn intruder screen
                child: spawnIntruder ? getSpawnIntruderScreen() : null,
              ),
              Center( //display spawn intruder screen
                child: intruderRetreats ? getIntruderRetreatsScreen() : null,
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
                  style: getButtonStyle(100, 60, Colors.blue[300]!),
                  child: const Text('Yes')
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
                  style: getButtonStyle(100, 60, Colors.blue[300]!),
                  child: const Text('No')
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
              style: getButtonStyle(200, 60, Colors.red[300]!),
              child: const Text('Resolved')
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
                    style: getButtonStyle(300, 60, queenOrCreeper ? Colors.grey[700]! : Colors.blue[300]!), //if the button was pressed, grey it out
                    child: const Text('Draw +1')
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        intruderRetreats = true;
                      });
                    },
                    style: getButtonStyle(300, 60, Colors.blue[300]!),
                    child: const Text('Intruder Retreats')
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
                    style: getButtonStyle(300, 60, Colors.red[300]!),
                    child: const Text('Finish')
                ),
              ]
          ),
        ),
Align(
  alignment: const Alignment(2, -0.5),
  child: queenOrCreeper ? Image.asset(nightStalkerAttackDeck.cards[1].picture, width: 350) : null,
),
      ]
    );
  }

  Widget getIntruderRetreatsScreen() {
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
                  Image.asset(eventDeck.cards[0].picture, width: 350),

                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          intruderRetreats = false;
                        });
                      },
                      style: getButtonStyle(300, 60, Colors.red[300]!),
                      child: const Text('Finish')
                  ),
                ]
            ),
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
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset(intruderGrabBag.tokens[0].picture),
                    ),

                    intruderGrabBag.tokens[0].name == 'Nothing' ? const SizedBox.shrink() : //if it is a blank token, do not display the stats
                    Column(
                        children:[
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                          ),

                          SizedBox(
                            width: 100,
                            child: Row(

                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[300],
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Image.asset('assets/misc assets/lightning.png'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                Text(
                                  intruderGrabBag.tokens[0].blue.toString(),
                                  style: GoogleFonts.novaSquare(
                                      color: Colors.blue[300], fontSize: 40, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                          ),
                          SizedBox(
                            width: 100,
                            child: Row(

                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.red[300],
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                    child: Image.asset('assets/misc assets/lightning.png'),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                Text(
                                  intruderGrabBag.tokens[0].red.toString(),
                                  style: GoogleFonts.novaSquare(
                                      color: Colors.red[300], fontSize: 40, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ]

                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                  ]
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                ),
                Text(
                  'Spawn ' + intruderGrabBag.tokens[0].name,
                  style: GoogleFonts.novaSquare(
                      color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.all(50.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        intruderGrabBag.shuffle();
                      });
                    },
                    style: getButtonStyle(300, 60, Colors.blue[300]!),
                    child: const Text('Shuffle test')
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        drawIntruderCard = true;
                        spawnIntruder = false;
                      });
                    },
                    style: getButtonStyle(300, 60, Colors.blue[300]!),
                    child: const Text('Surprise Attack')
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
                    style: getButtonStyle(300, 60, Colors.red[300]!),
                    child: const Text('Finish')
                ),
              ]
          ),
        ),
      ],
    );
  }



}

