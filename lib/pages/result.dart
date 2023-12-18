import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map<int, String> answers;

  ResultScreen(this.answers);

  int calculateScore() {
    int score = 0;
    // Define the correct answers for each question
    Map<int, String> correctAnswers = {
      1: 'London',
      2: 'Mars',
      3: 'elphant',
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
                    margin: EdgeInsets.only(top: 240.0), // Margin digunakan untuk mengatur posisi
                    child: Text(
                      '$score',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Sesuaikan warna teks dengan background
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
