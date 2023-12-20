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
      return 'https://cdn.idntimes.com/content-images/post/20220917/download-3fe6f95cbbd0783306717b8176109a2f_600x400.jpg';
    case 2:
      return 'https://www.dapurkobe.co.id/wp-content/uploads/kerak-telor.jpg';
    case 3:
      return 'https://seringjalan.com/wp-content/uploads/2020/06/Baju-Seting-Bangka-Belitung-830x1024.jpg';
    case 4:
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnH7VSN0R5d-dP5UsZbntcmxcPbTqwYG6M2vzkN4CW6ZIR1ffVmP5eGuCUkymaCKInBQE&usqp=CAU';
    case 5:
      return 'https://pariwisataindonesia.id/wp-content/uploads/2020/11/senjata-badik-Badik-Raja-foto-by-asyraafahmadicom.jpg';
  // ... Add URLs for other questions as needed
    default:
      return '';
  }
}

String getQuestionText(int questionNumber) {
  switch (questionNumber) {
    case 1:
      return 'Dari manakah asal rumah daerah pada gambar di atas?';
    case 2:
      return 'Kerak Telor adalah makanan yang berasal dari daerah?';
    case 3:
      return 'Pakaian adat gambar di atas \n berasal dari mana?';
    case 4:
      return 'Senjata Diatas \n Berasal dari daerah?';
    case 5:
      return 'Apa nama \n senjata di atas ?';
    default:
      return '';
  }
}

