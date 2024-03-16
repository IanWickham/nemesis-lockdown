import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart';

class PlayerPhaseMainScreen extends StatefulWidget {
  const PlayerPhaseMainScreen({super.key});

  @override
  State<PlayerPhaseMainScreen> createState() => _PlayerPhaseMainScreenState();
}

class _PlayerPhaseMainScreenState extends State<PlayerPhaseMainScreen> {
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
                    'Player Phase',
                    style: GoogleFonts.novaSquare(color: Colors.blue, fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                  ),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.green[200],
                        onTap: () {
                          setState(() {

                          });
                        },
                        child: Ink.image(
                          image: AssetImage(computerActionsDeck.cards[0].picture),
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      )
                  ),

                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseMainScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          backgroundColor: Colors.blue[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(300, 60),
                          textStyle: const TextStyle(
                              fontSize: 28, color: Colors.black)),
                      child: Text('Draw Intruder Card', style: GoogleFonts.novaSquare())
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseMainScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(width: 1, color: Colors.black),
                          backgroundColor: Colors.blue[300],
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fixedSize: const Size(300, 60),
                          textStyle: const TextStyle(
                              fontSize: 28, color: Colors.black)),
                      child: Text('Spawn Intruder', style: GoogleFonts.novaSquare())
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlayerPhaseMainScreen()),
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
                              fontSize: 28, color: Colors.black)),
                      child: Text('End Player Phase', style: GoogleFonts.novaSquare())
                  ),
                ]
            ),
          ),
        ],
      )
  );
}
