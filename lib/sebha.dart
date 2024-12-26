import 'dart:math';
import 'package:flutter/material.dart';
import 'BottomNavBar.dart';

void main() {
  runApp(const TasbihApp());
}

class TasbihApp extends StatelessWidget {
  const TasbihApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TasbihScreen(),
    );
  }
}

class TasbihScreen extends StatefulWidget {
  @override
  _TasbihScreenState createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int selectedIndex = -1;
  int counter = 0;
  int index =2;
  List<String> texts =["سبحان الله", "استغفر الله", "لا اله الا الله", "الله أكبر",];


  void incrementCounter() {
    setState(() {
      counter++;
      if (counter%33==0){
        index = (index + 1) % texts.length;

      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      index =0;
    });
  }

  void onBottomNavItemTapped(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Expanded(
      child: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/Background.png"), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 60.0), // Left, Top, Right, Bottom
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Stack(
                children: [
                 Container(
                   height: 171,
                   width: 291,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('assets/image/Mosque-01 1.png'), // Specify the image path
                       fit: BoxFit.cover,
                     ),
                    ),
                     ),


              Positioned(
                   top: 86,
                   bottom: 0,
                   left: 50,
                   right: 50,
                child:
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/Islami.png'), // Specify the image path
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),

              ),

                ],
              ),



              Text(
                "سبح اِسْمَ رَبِّكَ الأَعْلَى",
                style: TextStyle(
                  fontSize: 33,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Tasbih Counter
              GestureDetector(
                onTap: incrementCounter,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                   child: Container(
                      width: 350, // Set the width of the container
                      height: 350, // Set the height of the container
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/SebhaBody 1.png'), // Specify the image path
                          fit: BoxFit.cover, // Fit the image to the container (e.g., cover, contain, etc.)
                        ),
                        borderRadius: BorderRadius.circular(15), // Optional: Add rounded corners
                      ),
                    ),
                    ),
                    // Counter Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          texts[index],
                          style: TextStyle(

                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "$counter",
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
            BottomNavBar(
              selectedIndex: index,
              onItemTapped: onBottomNavItemTapped,
            ),
          )




        ],
      ),
      ),
     // floatingActionButton: FloatingActionButton(
      //  onPressed: resetCounter,
       // child: const Icon(Icons.refresh),
      //  backgroundColor: Colors.amber,
     // ),
    );
  }
}
