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
  bool draw = false;
  bool qbdialog = false;
  bool queenencounter = false;
  bool nonestcharacters = false;
  bool drawIntruderCard = false;
  bool intruderRetreats = false;
  bool done = false;
  String tokenimage = '';
  @override
  void initState() {
    super.initState();
setState(() {

});
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
                    padding: EdgeInsets.all(50.0),
                  ),
                  Text(
                    'Intruder Bag\nDevelopment',
                    style: GoogleFonts.novaSquare(color: Colors.yellow[300], fontSize: 35, fontWeight: FontWeight.bold),
                  ),




                  draw ? Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(tokenimage),
                  )
                      : Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.blue[300],
                        onTap: () {


                          setState(() {
                            intruderGrabBag.shuffle();
                            tokenimage = intruderGrabBag.tokens[0].picture;
                            draw = true;
                          });
                        },
                        child: Ink.image(
                          image: const AssetImage('assets/misc assets/intruderbag.png'),
                          height: 300,
                          width: 300,
                          fit: BoxFit.contain,
                          alignment: const Alignment(0, 0.7),
                        ),
                      )
                  ),

                  draw ? Text(
                    '${intruderGrabBag.tokens[0].name}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.novaSquare(
                      color: Colors.white, fontSize: 30,),)
                  : const Padding(
                    padding: EdgeInsets.all(20),
                  ),

                  Container(
                    height: 170,
                    width: 350,
                    child: draw
                        ? getIntruderTokenText(context) //gets the text for each token, swaps tokens, and generates queen dialog box
                        : Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                            ),
                            Text(
                              'Tap the bag\nto draw',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.novaSquare(
                                color: Colors.yellow[300], fontSize: 30,),),
                          ],
                        ),
                  ),




                  ElevatedButton(
                      onPressed: () {
                        if(draw) {
                          track = 0;
                          currentTurn--;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PlayerPhaseStartScreen()),
                          );}
                        else {Null;}
                      },
                      style: getButtonStyle(200, 60, draw ? Colors.red[300]! : Colors.grey[700]!),
                      child: Text('Next', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),

          Center(
              child: qbdialog ? getQueenBehaviorDialog() : null,
          ),
          Center(
            child: queenencounter ? getSpawnIntruderScreen() : null,
          ),
          Center(
            child: drawIntruderCard ? getDrawIntruderCardScreen() : null,
          ),
          Center(
            child: intruderRetreats ? getIntruderRetreatsScreen() : null,
          ),

        ],
      )
  );

  Text getIntruderTokenText(context) {
    String intrudertext = '';

    if(nonestcharacters) //print the explanation after saying no to the queen token prompt; prevents qbdialog from getting reassigned.
      {
        intrudertext = 'This token is returned to the bag, and an egg is added to the nest slot of the Laboratory Board.';
      }
    else if(intruderGrabBag.tokens[0].name == 'Nothing') {
      if(intruderGrabBag.possibleAdult.isEmpty)
        {
          intrudertext = 'This token is returned to the bag. There are no more adult tokens to add.';
        } else {
        intrudertext = 'This token is returned to the bag, and an adult token is added.';
        intruderGrabBag.randomlyAddToken(intruderGrabBag.possibleAdult);
      }

    }
    else if(intruderGrabBag.tokens[0].name == 'Larva') {
      intruderGrabBag.tokens.removeAt(0);
      if (intruderGrabBag.possibleAdult.isEmpty) {
        intrudertext =
        'This token is removed. There are no more adult tokens to add.';
      }
    else {
        intrudertext = 'This token is removed,\nand an adult token is added.';
        intruderGrabBag.randomlyAddToken(intruderGrabBag.possibleAdult);
      }
    }
    else if(intruderGrabBag.tokens[0].name == 'Creeper') {
      intrudertext = 'This token is removed,\nand a breeder token is added.';
      intruderGrabBag.tokens.removeAt(0);
      intruderGrabBag.randomlyAddToken(intruderGrabBag.possibleBreeder);
    }
    else if(intruderGrabBag.tokens[0].name == 'Adult' || intruderGrabBag.tokens[0].name == 'Breeder') {
      intrudertext = 'This token is returned to the bag; each character who is not in combat makes a noise roll.';
    }
    else if(queenencounter || done)
      {
        intrudertext = 'Queen Attack! The token is returned to the bag.';
      }
    else if(intruderGrabBag.tokens[0].name == 'Queen') {
      qbdialog = true;
    }
    return Text(
      intrudertext,
      textAlign: TextAlign.center,
      style: GoogleFonts.novaSquare(
        color: Colors.yellow[300], fontSize: 26,),);
  }

  Widget getQueenBehaviorDialog() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            border: Border.all(
              width: 2,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Are there any player characters in the nest?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.novaSquare(
                      color: Colors.red[200],
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
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
                          qbdialog = false;
                          queenencounter = true;
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
                          qbdialog = false;
                          nonestcharacters = true;
                        });
                      },
                      style: getButtonStyle(100, 60, Colors.blue[300]!),
                      child: const Text('No')
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

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
                  padding: EdgeInsets.all(40.0),
                ),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        drawIntruderCard = true;
                        queenencounter = false;
                        done = true;
                      });
                    },
                    style: getButtonStyle(300, 60, Colors.blue[300]!),
                    child: const Text('Surprise Attack')
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        queenencounter = false;
                        done = true;
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
                  Image.asset(intruderDeck.cards[0].picture, height: 495),

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                      },
                      style: getButtonStyle(300, 60, Colors.grey[700]!), //if the button was pressed, grey it out
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

                        //discards the second card to the discard pile if the user pressed 'draw +1'
                        intruderDeck.discardCard(1);
                        //discards the first card to the discard pile
                        intruderDeck.discardCard(0);
                        setState(() {
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
            alignment: const Alignment(3, -0.6),
            child: Image.asset(intruderDeck.cards[1].picture, height: 495),
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
                        //discards the first card to the discard pile
                        eventDeck.discardCard(0);
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

}