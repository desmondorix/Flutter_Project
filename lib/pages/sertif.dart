import 'package:flutter/material.dart';
import 'package:marbel/pages/home_page.dart';
import 'package:marbel/pages/main_page.dart';

class Sertif extends StatelessWidget {
  final TextEditingController usernameController;
  const Sertif({super.key, required this.usernameController});

  @override
  Widget build(BuildContext context) {
    String username = usernameController.text;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reward',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF572D15),
        centerTitle: true,
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
              fit: BoxFit.fill,
              image: AssetImage("assets/scorebg.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Card(
                          margin: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: const Color(0xFFD9E3DA),
                          elevation: 20,
                          child: Container(
                            width: 400,
                            height: 350,
                            child: Stack(
                              children: [
                                Container(
                                  height: 70,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100),
                                      bottomRight: Radius.circular(100),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset('assets/medal.png'),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Selamat Kepada',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '"$username"',
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      'Telah menyelesaikan pembelajaran dan Kuis Game Edukasi "Marbel Budaya Nusantara"',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // New green container positioned at the bottom
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: size.width,
                    height: 125,
                    color: const Color(0xFF602c2c),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.8, // Adjust the width as needed
                          child: const Text(
                            'Terima kasih telah menyelesaikan pembelajaran dan Kuis Game Edukasi “Marbel Budaya Nusantara". Kamu berhak mendapatkan sertifikat ini.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(
                                    usernameController: usernameController),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
