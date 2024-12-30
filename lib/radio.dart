import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'sebha.dart';

void main() {
  runApp(IslamiRadioApp());
}

class IslamiRadioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RadioScreen(),
    );
  }
}

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedIndex = 3; // Track the selected index
  List<String> radioStations =[
    'Radio Ibrahim Al-Akdar',
    'Radio Al-Qaria Yassen',
    'Radio Ahmed Al-trabulsi',
    'Radio Addokali Mohammad Alalim',
  ];

  // Function to handle BottomNavBar item taps
  void onBottomNavItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/taj-mahal-agra-india 2.png"), // Add your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center image with text overlay
                Stack(
                  children: [
                    Container(
                      height: 171,
                      width: 291,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/Mosque-01 1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 86,
                      left: 50,
                      right: 50,
                      child: Container(
                        height: 40, // Adjust height and width
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/image/Islami.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add spacing between elements
                // Buttons Row
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:Colors.black12,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    SizedBox(
                    width: MediaQuery.of(context).size.width / 2.3,
                      child:TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFE2BE7F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )

                        ),
                        child: Text('Radio', style: TextStyle(color: Colors.white)),
                      ),
                      ),
                      SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child:TextButton(
                        onPressed: () {},
                        child: Text('Reciters', style: TextStyle(color: Colors.white)),
                      ),
                      )],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // Number of items per row
               mainAxisSpacing: 10, // Spacing between rows
            crossAxisSpacing: 10, // Spacing between columns
          childAspectRatio: 3, // Width to height ratio
           ),
            itemCount: radioStations.length,
             itemBuilder: (context, index) {
      return RadioTile(title: radioStations[index]);
    }
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: onBottomNavItemTapped,
      ),
    );
  }
}

class RadioTile extends StatelessWidget {
  final String title;
  final bool isPlaying;

  RadioTile({required this.title, this.isPlaying = false});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding:  EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Color(0xFFE2BE7F),

    borderRadius: BorderRadius.circular(16), // Rounded corners
    boxShadow: [
    BoxShadow(
    color: Colors.black26, // Shadow color
    blurRadius: 8, // Blur effect
    offset: Offset(0, 4), // Offset of the shadow
    ),
    ],
      border: Border.all(
        color: Colors.black, // Border color
        width: 2, // Border width
      ),
    ),
        child:
        Column(
    children: [
    Expanded(
    child: Text(
    title,
    style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    ),
    overflow: TextOverflow.ellipsis, // Handle long text
    ),
    ),

       Stack(
       children: [

         Container(
           decoration:
            BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/image/Background Image.png"),
               ))),

       Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
              style: ButtonStyle(
                iconSize:  MaterialStateProperty.all(40.0),
              ),
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black),
              onPressed: () {},
            ),

            IconButton(
              style: ButtonStyle(
                iconSize: MaterialStateProperty.all(27.0),
              ),

              icon: Icon(isPlaying ? Icons.volume_up_rounded : Icons.volume_off, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
    ])]));
  }
}

