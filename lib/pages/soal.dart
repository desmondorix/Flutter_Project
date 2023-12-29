import 'package:flutter/material.dart';
import 'package:marbel/pages/result.dart';
import 'package:marbel/widget/answerContain.dart';
import 'package:marbel/widget/questionContain.dart';
import 'package:http/http.dart' as http;

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            color: Colors.black, // Ubah warna teks menjadi hitam
          ),
        ),
        centerTitle: true, // Tengahkan judul
        backgroundColor: Color(0xFFD2B69F),
        automaticallyImplyLeading: false,
      ),
      body: QuizBody(),
    );
  }
}

class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int currentQuestion = 1;
  Map<int, String> answers = {};

  int calculateScore() {
    int score = 0;
    // Define the correct answers for each question
    Map<int, String> correctAnswers = {
      1: 'Padang',
      2: 'Jakarta',
      3: 'Bangka Belitung',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        SizedBox(height: 10),
        Container(
          height: 40,
          child: ListView.builder(

            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              int questionNumber = index + 1;
              return Row(
                children: [
                  if (index == 0) // Show "text" only for the first item
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Pertanyaan',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentQuestion = questionNumber;
                      });
                    },
                    child: Container(
                      width: 40,
                      margin: EdgeInsets.symmetric(horizontal: 2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentQuestion == questionNumber
                            ? Color(0xFFB64D3A)
                            : Color(0xFFD2B69F),
                      ),
                      child: Center(
                        child: Text(
                          '$questionNumber',
                          style: TextStyle(
                            color: currentQuestion == questionNumber
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        SizedBox(height: 10),
        getQuestionContainer(currentQuestion, context),
        SizedBox(height: 10),
        Column(
          children: [
            ContainerOption(
              getQuestionOptions(currentQuestion)[0], // Option A
              'Red',
              answers[currentQuestion],
                  () {
                setSelectedOption(getQuestionOptions(currentQuestion)[0]);
              },
            ),
            ContainerOption(
              getQuestionOptions(currentQuestion)[1], // Option B
              'Red',
              answers[currentQuestion],
                  () {
                setSelectedOption(getQuestionOptions(currentQuestion)[1]);
              },
            ),
            ContainerOption(
              getQuestionOptions(currentQuestion)[2], // Option C
              'Red',
              answers[currentQuestion],
                  () {
                setSelectedOption(getQuestionOptions(currentQuestion)[2]);
              },
            ),
            ContainerOption(
              getQuestionOptions(currentQuestion)[3], // Option D
              'Red',
              answers[currentQuestion],
                  () {
                setSelectedOption(getQuestionOptions(currentQuestion)[3]);
              },
            ),
          ],
        ),

        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                if (currentQuestion > 1) {
                  setState(() {
                    currentQuestion--;
                  });
                }
              },
              child: Text('Previous'),
            ),
            ElevatedButton(
              onPressed: () {
                if (currentQuestion < 5) {
                  setState(() {
                    currentQuestion++;
                  });
                } else {
                  // Show confirmation dialog for submitting answers
                  _showConfirmationDialog();
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
        SizedBox(height: 20),

      ],
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('SIMPAN JAWABAN ?'),
          content: Text('Tekan YES apabila ingin menyimpan dan NO untuk kembali ke soal, pastikan semua jawaban telah terisi'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Close the dialog and return false
              },
              child: Text('No',
                style: TextStyle(
                  color: Colors.red, // Ubah warna teks menjadi hitam
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Close the dialog and return true
              },
              child: Text('YES',
                style: TextStyle(
                  color: Colors.green, // Ubah warna teks menjadi hitam
                ),
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        // User pressed 'Yes', calculate score and navigate to ResultScreen
        int score = calculateScore();
        String username = "witol"; // Gantilah dengan cara mendapatkan nama pengguna yang diinputkan pada saat login
        sendScoreToServer(username, score);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(score)),
        );
      }
    });
  }

  void sendScoreToServer(String username, int score) async {
    final url = '"http://10.0.2.2/study_flutter/save_score.php"';
    final response = await http.post(
      Uri.parse(url),
      body: {'username': username, 'score': score.toString()},
    );

    if (response.statusCode == 200) {
      print('Score sent successfully');
    } else {
      print('Failed to send score. Error: ${response.reasonPhrase}');
    }
  }
  void setSelectedOption(String option) {
    setState(() {
      answers[currentQuestion] = option;
    });
  }
}