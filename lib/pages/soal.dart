import 'package:flutter/material.dart';
import 'package:marbel/pages/result.dart';
import 'package:marbel/widget/answerContain.dart';
import 'package:marbel/widget/questionContain.dart';


class QuizScreen extends StatelessWidget {
  final TextEditingController usernameController;
  const QuizScreen({Key? key, required this.usernameController});
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
      ),
      body: QuizBody(usernameController: usernameController,),
    );
  }
}

class QuizBody extends StatefulWidget {
  
final TextEditingController usernameController;

  const QuizBody({Key? key, required this.usernameController})
      : super(key: key);

  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int currentQuestion = 1;
  Map<int, String> answers = {};

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
                )
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Close the dialog and return true
                },
                child: Text('YES',
                  style: TextStyle(
                    color: Colors.green, // Ubah warna teks menjadi hitam
                  ),
                )
            )
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        // User pressed 'Yes', navigate to the ResultScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(answers: answers, usernameController: widget.usernameController)),
        );
      }
    });
  }


  List<String> getQuestionOptions(int questionNumber) {
    switch (questionNumber) {
      case 1:
        return ['Paris', 'London', 'Berlin', 'Madrid'];
      case 2:
        return ['Mars', 'Venus', 'Jupiter', 'Saturn'];
      case 3:
        return ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'];
      case 4:
        return ['1492', '1607', '1776', '1812'];
      case 5:
        return ['Avocado', 'Tomato', 'Onion', 'Garlic'];
      default:
        return [];
    }
  }

  String getQuestionText(int questionNumber) {
    switch (questionNumber) {
      case 1:
        return 'What is the capital of France?';
      case 2:
        return 'Which planet is known as the Red Planet?';
      case 3:
        return 'What is the largest mammal on Earth?';
      case 4:
        return 'In which year did Christopher Columbus reach the Americas?';
      case 5:
        return 'What is the main ingredient in guacamole?';
      default:
        return '';
    }
  }

  void setSelectedOption(String option) {
    setState(() {
      answers[currentQuestion] = option;
    });
  }
}
