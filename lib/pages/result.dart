import 'package:flutter/material.dart';
import 'package:marbel/pages/sertif.dart';
import 'package:marbel/services.dart';

class ResultScreen extends StatelessWidget {
  final TextEditingController usernameController;
  final Map<int, String> answers;

  const ResultScreen(
      {Key? key, required this.answers, required this.usernameController});

  int calculateScore() {
    int score = 0;
    // Define the correct answers for each question
    Map<int, String> correctAnswers = {
      1: 'Padang',
      2: 'Jakarta',
      3: 'Bangka Belitung', // Correct the spelling of 'elephant'
      4: 'Aceh',
      5: 'Badik Raja',
    };

    // Calculate the score based on correct answers
    for (int i = 1; i <= 5; i++) {
      if (answers[i] == correctAnswers[i]) {
        score += 20;
      }
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();
    String username = usernameController.text.trim();

    return WillPopScope(
      onWillPop: () async {
        // Prevent the user from going back to the QuizScreen
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Hasil Kuis'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/Scoring.png', // Ganti dengan path ke gambar background Anda
              fit: BoxFit.cover,
            ),
            // Centered Column
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 240.0), // Margin digunakan untuk mengatur posisi
                    child: Text(
                      '$score',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Sesuaikan warna teks dengan background
                      ),
                    ),
                  ),
                  const SizedBox(
                      height:
                          20), // Add some space between the score and the button
                  Container(
                    margin: const EdgeInsets.only(top: 240.0),
                    width: 300, // Set the width of the button
                    height: 100, // Set the height of the button
                    alignment: Alignment
                        .center, // Align the button content to the center
                    child: ElevatedButton(
                      onPressed: () async {
                        // Panggil fungsi submitScore untuk menyimpan nilai ke server
                        await Services.submitScore(
                            username:
                                username, // Ganti dengan username yang sesuai
                            nilai: score.toString());

                        // Navigate to the next page (RewardPage)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return Sertif(usernameController : usernameController);
                          },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF572D15), // Specify the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              35.0), // Set the border radius
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Ambil \nSertifikat',
                          textAlign:
                              TextAlign.center, // Center the text horizontally
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
