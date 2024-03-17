import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nemesis_lockdown_companion/player_phase_start_screen.dart';
import 'decks.dart';
import 'globals.dart';

class CharacterDraftScreen extends StatefulWidget {
  const CharacterDraftScreen({super.key});

  @override
  State<CharacterDraftScreen> createState() => _CharacterDraftScreenState();
}

class _CharacterDraftScreenState extends State<CharacterDraftScreen> {
int currentPlayer = 1;
bool topIsPressed = false;
bool botIsPressed = false;
bool error = false;
var characterDraftDeck = CharacterDraft();


@override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Stack(
            children: <Widget>[
              getBackground(),
              Center(
                child: IgnorePointer(
                  ignoring: error, //Ignore input when the error message is displayed
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player $currentPlayer',
                        style: GoogleFonts.novaSquare(
                            color: Colors.red[300], fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Choose your Character',
                        style: GoogleFonts.novaSquare(
                            color: Colors.white, fontSize: 30),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(//Wrap the Material widget for the character selection border
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: topIsPressed ? (Colors.green[300])! : Colors.transparent,
                            width: 5,
                          )
                        ),
                          //Wrap the inkwell in a material because it was the only way I found to get it to display on the top of the stack
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.lightGreen[200],
                                onTap: () {
                                  setState(() {
                                    topIsPressed = true;
                                    botIsPressed = false;
                                  });
                                },
                                child: Ink.image(
                                  image: AssetImage(characterDraftDeck.cards[0].picture),
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              )
                          ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(//Wrap the Material widget for the character selection border
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: botIsPressed ? (Colors.green[300])! : Colors.transparent,
                              width: 5,
                            )
                        ),
                        //Wrap the inkwell in a material because it was the only way I found to get it to display on the top of the stack
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.lightGreen[200],
                              onTap: () {
                                setState(() {
                                  topIsPressed = false;
                                  botIsPressed = true;
                                });
                              },
                              child: Ink.image(
                                image: AssetImage(characterDraftDeck.cards[1].picture),
                                height: 300,
                                fit: BoxFit.cover,
                              ),
                            )
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if(!topIsPressed && !botIsPressed)
                              {
                                setState((){
                                  error = true;
                                });
                              }
                            else if(topIsPressed || botIsPressed) {
                              if (currentPlayer == playerCount) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => const PlayerPhaseStartScreen()),
                                );
                              }
                              else if (topIsPressed) {
                                setState(() {
                                  characterDraftDeck.removeCard(0);
                                  topIsPressed = false;
                                  botIsPressed = false;
                                  currentPlayer++;
                                  characterDraftDeck.shuffle();
                                });
                              }
                              else if (botIsPressed) {
                                setState(() {
                                  characterDraftDeck.removeCard(1);
                                  topIsPressed = false;
                                  botIsPressed = false;
                                  currentPlayer++;
                                  characterDraftDeck.shuffle();
                                });
                              }
                            }
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
                                  fontSize: 30, color: Colors.black)),
                          child: Text('Next', style: GoogleFonts.novaSquare())
                      ),
                    ]
                ),
                )
              ),
              Center(//display error message
                child: error ? getErrorMessage() : null,
              ),
            ],
          )
      );

  }
  Widget getErrorMessage() {
    return Container(
      height: 330,
      width: 230,
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
            'Select an option',
            style: GoogleFonts.novaSquare(
                color: Colors.red[200], fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(40.0),
          ),
          ElevatedButton(
              onPressed: () {
                setState((){
                  error = false;
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
                  fixedSize: const Size(150, 60),
                  textStyle: const TextStyle(
                      fontSize: 30, color: Colors.black)),
              child: Text('Ok', style: GoogleFonts.novaSquare())
          ),
        ],
      ),
    );
  }
}
