import 'package:flutter/material.dart';


Widget getQuestionContainer(int questionNumber, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    child: GestureDetector(
      child: Container(
        width: size.width,
        height: size.height / 2.8,
        decoration: BoxDecoration(
          color: Color(0xFFCF9C6F),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(getQuestionImageUrl(questionNumber)),
                width: size.height,
                height: 220,
              ),
            ),
            Positioned(
              bottom: 3,
              left: 23,
              right: 23,
              child: Text(
                getQuestionText(questionNumber),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
String getQuestionImageUrl(int questionNumber) {
  // Provide image URLs based on the question number
  switch (questionNumber) {
    case 1:
      return 'https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg';
    case 2:
      return 'https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg';
    case 3:
      return 'https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg';
    case 4:
      return 'https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg';
    case 5:
      return 'https://asset.kompas.com/crops/-tukq-UsIymUQXKSNIR6jGI23fA=/0x0:1000x667/750x500/data/photo/2022/12/31/63afd57be0e64.jpg';
  // ... Add URLs for other questions as needed
    default:
      return '';
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

