import 'package:flutter/material.dart';
import 'package:marbel/pages/home_page.dart';
import 'package:marbel/pages/scoreboardPage.dart';
import 'package:marbel/pages/soal.dart';
import 'package:marbel/view/kategori.dart';

class MainPage extends StatefulWidget {
  final TextEditingController usernameController;
  const MainPage({super.key, required this.usernameController});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFD8DAD9),
      appBar: AppBar(
        title: const Text(
          'MARBEL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
        centerTitle: true,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {
              _showLogoutDialog();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: size.width,
                    height: size.height / 1.8,
                    child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/logo_main.jpg"))),
                Positioned(
                  top: 60,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 3,
                            blurRadius: 3,
                          )
                        ]),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3,
                        offset: Offset(3, 3))
                  ]),
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    backgroundColor: Colors.grey[400],
                    foregroundColor: Colors.black,
                    minimumSize: const Size(250, 50),
                    shadowColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Kategori(),
                    ),
                  );
                },
                child: const Text('Mulai Belajar',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3,
                        offset: Offset(3, 3))
                  ]),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  minimumSize: const Size(250, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                          usernameController: widget.usernameController),
                    ),
                  );
                },
                child: const Text(
                  'Quiz',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 3,
                        offset: Offset(3, 3))
                  ]),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  minimumSize: const Size(250, 50),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScoreBoard(
                        usernameController: widget.usernameController,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Apakah Anda yakin ingin Keluar?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the login page when user confirms logout
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.red, // Set the text color to red
              ),
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
