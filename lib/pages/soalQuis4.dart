import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:marbel/main.dart';
import 'package:marbel/pages/soalQuis.dart';
import 'package:marbel/pages/soalQuis2.dart';
import 'package:marbel/pages/soalQuis3.dart';
import 'package:marbel/pages/soalQuis4.dart';
import 'package:marbel/pages/soalQuis5.dart';
import 'package:marbel/widget/answerContain.dart';
import 'package:marbel/widget/questionContain.dart';

class soal4 extends StatefulWidget {
  const soal4({Key? key}) : super(key: key);

  @override
  State<soal4> createState() => _soal4State();
}
class QuizData extends ChangeNotifier {
  int selectedAnswerIndex = -1; // Initialize with an invalid index

  void setSelectedAnswer(int index) {
    selectedAnswerIndex = index;
    notifyListeners();
  }
}
class _soal4State extends State<soal4> {
  PageController _pageController = PageController();
  List<Map<String, dynamic>> soal = [
    {
      "question": "fawdaefsdhghklpjohuikhukhukhfs?",
      "imagePath":
      "https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg",
      "jawaban1": "kalffsmantan",
      "jawaban2": "bantsefsesen",
      "jawaban3": "suflawesi",
      "jawaban4": "jafsfswa",
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ'),
        backgroundColor: Color(0xFFD2B69F),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          controller: _pageController,
          itemCount: soal.length,
          itemBuilder: (context, index) {
            var questionData = soal[index];
            return ChangeNotifierProvider(
              create: (context) => QuizData(), // Provide QuizData instance
              child: Consumer<QuizData>(
                builder: (context, quizData, _) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      // Row containing "soal" text and containers with circles and numbers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text label "soal"
                          Text(
                            "Pertayaan",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8), // Add some spacing
                          // Containers with circles and numbers
                          ...List.generate(
                            5,
                                (index) => InkWell(
                              onTap: () {
                                // Handle button tap
                                if (index == 1) {
                                  // Navigate to another page when the user clicks on the circle with the number 2
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(builder: (context) => soal2()),
                                  );
                                }
                                if (index == 2) {
                                  // Navigate to another page when the user clicks on the circle with the number 2
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(builder: (context) => soal3()),
                                  );
                                }
                                if (index == 0) {
                                  // Navigate to another page when the user clicks on the circle with the number 2
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(builder: (context) => QuizPage()),
                                  );
                                }
                                if (index == 4) {
                                  // Navigate to another page when the user clicks on the circle with the number 2
                                  Navigator.pop(
                                    context,
                                    MaterialPageRoute(builder: (context) => soal5()),
                                  );
                                }
                                else {
                                  print('Button $index tapped');
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == 3 ? Color(0xFFB64D3A) : Colors.white,
                                  border: Border.all(
                                    color: Color(0xFFB64D3A),
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                      color: index == 3 ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Teks pertanyaan
                      DestinationCard(
                        imagePath: questionData["imagePath"],
                        question: questionData["question"],
                      ),
                      // Opsi jawaban
                      OpsiJawaban(
                        jawaban1: questionData["jawaban1"],
                        jawaban2: questionData["jawaban2"],
                        jawaban3: questionData["jawaban3"],
                        jawaban4: questionData["jawaban4"],
                        onSelect: (index) {
                          quizData.setSelectedAnswer(index);
                        },
                      ),
                      if (index == soal.length - 1)
                        const SizedBox(height: 24)
                      else
                        const SizedBox.shrink()
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}