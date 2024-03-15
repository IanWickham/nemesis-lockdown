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
bool pressAttention1 = false;
bool pressAttention2 = false;
var characterDraftDeck = new CharacterDraft();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Stack(
            children: <Widget>[

              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/texture.jpg'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 4,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              Center(
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
                      Container(//wrap in container for the border
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: (Colors.green[300])!,
                            width: pressAttention1 ? 5 : 0,
                          )
                        ),
                          //had to wrap the inkwell in a material because it was the only way I found to get it to display on the top of the stack
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                splashColor: Colors.green[200],
                                onTap: () {
                                  setState(() {
                                    pressAttention1 = true;
                                    pressAttention2 = false;
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
                      Container(//wrap in container for the border
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: (Colors.green[300])!,
                              width: pressAttention2 ? 5 : 0,
                            )
                        ),
                        //had to wrap the inkwell in a material because it was the only way I found to get it to display on the top of the stack
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.green[200],
                              onTap: () {
                                setState(() {
                                  pressAttention1 = false;
                                  pressAttention2 = true;
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
                            if (currentPlayer == playerCount) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PlayerPhaseStartScreen()),
                              );
                            }
                            else {
                              if(pressAttention1 == true)
                              {
                                characterDraftDeck.removeCard(0);
                              }
                              else if(pressAttention2 == true)
                              {
                                characterDraftDeck.removeCard(1);
                              }
                              setState((){
                                pressAttention1 = false;
                                pressAttention2 = false;
                                currentPlayer++;
                                characterDraftDeck.shuffle();
                              });

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
              ),
            ],
          )
      );

  }
}
