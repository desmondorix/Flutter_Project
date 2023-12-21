import 'package:flutter/material.dart';
import 'package:marbel/pages/rewardPage.dart';

class ResultScreen extends StatelessWidget {
  final Map<int, String> answers;

  ResultScreen(this.answers);

  int calculateScore() {
    int score = 0;
    // Define the correct answers for each question
    Map<int, String> correctAnswers = {
      1: 'London',
      2: 'Mars',
      3: 'elephant', // Correct the spelling of 'elephant'
      4: '1492',
      5: 'Garlic',
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

    return WillPopScope(
      onWillPop: () async {
        // Prevent the user from going back to the QuizScreen
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Result'),
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
                    margin: EdgeInsets.only(
                        top: 240.0), // Margin digunakan untuk mengatur posisi
                    child: Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // Sesuaikan warna teks dengan background
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          20), // Add some space between the score and the button
                  Container(
                    margin: EdgeInsets.only(top: 240.0),
                    width: 300, // Set the width of the button
                    height: 100, // Set the height of the button
                    alignment: Alignment
                        .center, // Align the button content to the center
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the next page (replace 'NextPage' with the actual page name)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Sertif()), // Ganti dengan nama kelas halaman berikutnya Anda
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF572D15), // Specify the button color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              35.0), // Set the border radius
                        ),
                      ),
                      child: Center(
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
