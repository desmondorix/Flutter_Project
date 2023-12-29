import 'package:flutter/material.dart';
import 'package:marbel/pages/budaya_page.dart';
import 'package:marbel/pages/main_page.dart';

class ScoreBoard extends StatefulWidget {
  final TextEditingController usernameController;
  const ScoreBoard({Key? key, required this.usernameController})
      : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  TextEditingController scoreController = TextEditingController();
  TextEditingController classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Tambahkan properti ini
          children: [
            // Score Board
            const Expanded(
              child: Text(
                'Score Board',
                textAlign: TextAlign.center, // Tambahkan properti ini
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),

            // Icon Home
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.home),
                color: Colors.white,
                iconSize: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(
                        usernameController: widget.usernameController,
                      ),
                    ),
                  );
                  // Your home navigation logic goes here
                },
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF572D15),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(70),
          ),
        ),
        elevation: 20,
      ),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: const Image(
                fit: BoxFit.fill, image: AssetImage("assets/scorebg.png")),
          ),

          const Positioned(
              top: 150,
              left: 140,
              child: Text("Score",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))),
          // Positioned Container A
          Positioned(
            top: 220,
            left: 70,
            right: 70,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(150),
              ),
              child: TextField(
                controller: scoreController,
                decoration: const InputDecoration(
                  hintText: '100',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Positioned(
            top: 250, // Atur posisi top
            left: 20, // Atur posisi left
            child: Image(
              image: AssetImage(
                  "assets/psgame.png"), // Ganti dengan path image Anda
              width: 100, // Atur lebar image
              height: 100, // Atur tinggi image
            ),
          ),

          const Positioned(
              bottom: 250,
              left: 50,
              child: Text("Nama",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))),

          // Positioned Container B
          Positioned(
            top: 450,
            left: 20,
            width: 150,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  widget.usernameController
                      .text, // Display the text from the controller
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20, fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
          ),

          const Positioned(
              bottom: 250,
              right: 60,
              child: Text("Kelas",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline))),
          // Positioned Container C
          Positioned(
            top: 450,
            right: 20.0,
            width: 150.0,
            child: Container(
              width: 150,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100),
              ),
              child: TextField(
                controller: classController,
                decoration: const InputDecoration(
                  hintText: 'kelas 1',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: 70,
              color: const Color(0xFF602c2c),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.7, // Adjust the width as needed
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 50, // Atur posisi top
            right: 20, // Atur posisi left
            child: Image(
              image: AssetImage(
                  "assets/gameboy.png"), // Ganti dengan path image Anda
              width: 100, // Atur lebar image
              height: 100, // Atur tinggi image
            ),
          ),
        ],
      ),
    );
  }
}
