import 'package:flutter/material.dart';
class OpsiJawaban extends StatefulWidget {
  final String jawaban1;
  final String jawaban2;
  final String jawaban3;
  final String jawaban4;
  final Function(int) onSelect;

  const OpsiJawaban({
    Key? key,
    required this.jawaban1,
    required this.jawaban2,
    required this.jawaban3,
    required this.jawaban4,
    required this.onSelect,
  }) : super(key: key);

  @override
  State<OpsiJawaban> createState() => _OpsiJawabanState();
}

class _OpsiJawabanState extends State<OpsiJawaban> {
  int selectedOptionIndex = -1; // Initialize with an invalid index

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double containerWidth = size.width * 0.7; // Adjust the width as needed

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildOptionButton(widget.jawaban1, containerWidth, 0),
          SizedBox(height: 16.0),
          buildOptionButton(widget.jawaban2, containerWidth, 1),
          SizedBox(height: 16.0),
          buildOptionButton(widget.jawaban3, containerWidth, 2),
          SizedBox(height: 16.0),
          buildOptionButton(widget.jawaban4, containerWidth, 3),
        ],
      ),
    );
  }

  Widget buildOptionButton(String text, double containerWidth, int index) {
    bool isSelected = selectedOptionIndex == index;

    return GestureDetector(
      onTap: () {
        // Handle the option selection
        setState(() {
          selectedOptionIndex = index;
        });
        widget.onSelect(index); // Notify the parent widget about the selected option
        print('Selected option: $text');
      },
      child: Container(
        width: containerWidth,
        height: 55.0, // Adjust the height as needed
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFB64D3A) : Color(0xFFCF9C6F),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
