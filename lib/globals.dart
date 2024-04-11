library my_prj.globals;
import 'package:flutter/material.dart';
import 'decks.dart';
import 'package:google_fonts/google_fonts.dart';

int playerCount = 0; //initialize to 0, playerCount gets defined in PlayerNumberScreen
int currentTurn = 1; //initialize to up to 15, starting at 1,gets defines in EventPhaseMainScreen
int track=0;
var nightStalkerAttackDeck = NightStalkerAttack();
var computerActionsDeck = ComputerActions();
//var characterDraftDeck = CharacterDraft();
var eventDeck = Event();
var intruderGrabBag = TokenGrabBag();


Widget getBackground() {
  return Container(
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
  );
}


Widget getTurnCounter() {
  return Positioned( //Place it at the top, and not use the entire screen
    top: 0.0,
    left: 0.0,
    right: 0.0,
    //Displays current turn
    child: Column(
      children: [
        AppBar(title: RichText(
            text: TextSpan(
                style: GoogleFonts.novaSquare(fontSize: 22),
                children: <TextSpan>[
                  for(int i = 15; i >= 1; i--)
                    ...[
                      const TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: '$i',
                        style: TextStyle(
                          color: (currentTurn == i) ? Colors.white : Colors.grey,
                          background: Paint()
                            ..color = (currentTurn == i)
                                ? Colors.red[400]!
                                : Colors.transparent
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2.0
                            ..strokeJoin = StrokeJoin.bevel
                            ..blendMode = BlendMode.difference,
                        ),
                      ),
                    ],
                  const TextSpan(
                    text: ' ',
                  ),
                ]
            )
        ),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
        // Player phase text
        Text(
          getPlayerPhaseText(), // Call a function to determine the player phase text
          style: getPlayerPhaseTextStyle(), // Adjust style as needed
        ),
      ],
    ),
  );
}




String getPlayerPhaseText() {
  if (track == 0) {
    return 'Player Phase';
  }
  else {
    return 'Event Phase';
  }
}

TextStyle getPlayerPhaseTextStyle() {
  if (track == 0) {
    return GoogleFonts.novaSquare(
        color: Colors.blue, fontSize: 30); // Blue for player phase
  } else {
    return GoogleFonts.novaSquare(
        color: Colors.red, fontSize: 30); // Red for event phase
  }
}



ButtonStyle getButtonStyle(double width, double height, Color color, [double? fontsize]) {//optional parameter for fontsize to format text
return ElevatedButton.styleFrom(
  side: const BorderSide(width: 1, color: Colors.black),
  backgroundColor: color,
  foregroundColor: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  fixedSize: Size(width, height),
  textStyle: TextStyle(fontSize: fontsize ?? 30, color: Colors.black, fontFamily: 'NovaSquare'));
}


