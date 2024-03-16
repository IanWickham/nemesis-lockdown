library my_prj.globals;
import 'package:flutter/material.dart';
import 'decks.dart';
import 'package:google_fonts/google_fonts.dart';

int playerCount = 0;
int currentTurn = 7;
var nightStalkerAttackDeck = NightStalkerAttack();
var computerActionsDeck = ComputerActions();
//var characterDraftDeck = CharacterDraft();
var eventDeck = Event();

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
    child: AppBar(title: RichText(
        text: TextSpan(
            style: GoogleFonts.novaSquare(fontSize: 22),
            children: <TextSpan>[
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '15',
                style: TextStyle(
                  color: (currentTurn==15) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==15) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '14',
                style: TextStyle(
                  color: (currentTurn==14) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==14) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '13',
                style: TextStyle(
                  color: (currentTurn==13) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==13) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '12',
                style: TextStyle(
                  color: (currentTurn==12) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==12) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '11',
                style: TextStyle(
                  color: (currentTurn==11) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==11) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '10',
                style: TextStyle(
                  color: (currentTurn==10) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==10) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '9',
                style: TextStyle(
                  color: (currentTurn==9) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==9) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '8',
                style: TextStyle(
                  color: (currentTurn==8) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==8) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '7',
                style: TextStyle(
                  color: (currentTurn==7) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==7) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '6',
                style: TextStyle(
                  color: (currentTurn==6) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==6) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '5',
                style: TextStyle(
                  color: (currentTurn==5) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==5) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '4',
                style: TextStyle(
                  color: (currentTurn==4) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==4) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '3',
                style: TextStyle(
                  color: (currentTurn==3) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==3) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '2',
                style: TextStyle(
                  color: (currentTurn==2) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==2) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth =  2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: '1',
                style: TextStyle(
                  color: (currentTurn==1) ? Colors.white : Colors.grey,
                  background: Paint()
                    ..color = (currentTurn==1) ? Colors.red[400]! : Colors.transparent
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..strokeJoin = StrokeJoin.bevel
                    ..blendMode = BlendMode.difference,
                ),
              ),
              const TextSpan(
                text: ' ',
              ),

            ]
        )
    ),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
    ),);
}


