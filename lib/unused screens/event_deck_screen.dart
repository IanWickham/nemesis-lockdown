import 'package:flutter/material.dart' hide Card;  //hides Card class in material
import '../decks.dart';
import 'package:google_fonts/google_fonts.dart';


class EventDeckScreen extends StatefulWidget {
  @override
  State<EventDeckScreen> createState() => _EventDeckScreenState();
}

class _EventDeckScreenState extends State<EventDeckScreen> {
  //const EventDeckScreen({super.key});
  var eventDeck = new Event();
  var img = 'assets/event/back_of_card.png';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      title: const Text('Event Deck'),
      actions: const [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.arrow_back),
        ),
      ],
    ),

    body: Container (
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Semantics(
            image: true,
            label: 'Event Deck back of card',
            child: Image.asset(img),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Row(            //row of the second two buttons
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    eventDeck.shuffle();
                    setState(() {
                      img = 'assets/event/back_of_card.png';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1, color: Colors.black),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(160, 60),
                      textStyle: const TextStyle(
                          fontSize: 30, color: Colors.black)),
                  child: Text('Shuffle', style: GoogleFonts.novaSquare())
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      img = eventDeck.drawCard();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 1, color: Colors.black),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(160, 60),
                      textStyle: const TextStyle(
                          fontSize: 30, color: Colors.black)),
                  child: Text('Draw', style: GoogleFonts.novaSquare())
              ),
            ],
          ),
        ],
      ),
    ),

      drawer: Drawer(
        child: Container(
          color: const Color(0xFF5D100A),         //a very specific dark maroon I found
          child: const Center(
            child: Text("Game Instructions"),
          ),
        ),
      ),

    );
}

