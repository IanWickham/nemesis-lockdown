import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'setup_screen.dart';
import 'globals.dart';

class HomeScreen extends StatelessWidget {
  //class for the home screen
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/box_art2.jpg'),
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
                  const Padding(
                    padding: EdgeInsets.all(110.0),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SetupScreen()),
                        );
                      },
                      style: getButtonStyle(200, 60, Colors.blue),
                      child: const Text('Start')
                  ),
                ]
              ),
              ),
            ],
          )
      );
}
