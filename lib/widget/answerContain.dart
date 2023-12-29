import 'package:flutter/material.dart';

class ContainerOption extends StatelessWidget {
  final String text;
  final String color;
  final String? selectedOption;
  final VoidCallback onTap;

  ContainerOption(this.text, this.color, this.selectedOption, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0), // Add padding around each container
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200.0, // Set a fixed width for all containers
          height: 50.0, // Adjust the height as needed
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: selectedOption == text ? Color(0xFFB64D3A) : getColor(color),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }


  Color getColor(String? color) {
    switch (color) {
      case 'Red':
        return Color(0xFFCF9C6F);
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Purple':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

}

List<String> getQuestionOptions(int questionNumber) {
  switch (questionNumber) {
    case 1:
      return ['Padang', 'Aceh', 'Jakarta', 'Papua'];
    case 2:
      return ['Palembang', 'Aceh', 'Jakarta', 'NTT'];
    case 3:
      return ['Bangka Belitung', 'Sumatra Utara', 'Riau', 'Aceh'];
    case 4:
      return ['Palembang', 'Aceh', 'Jawa Barat', 'NTT'];
    case 5:
      return ['Badik Raja', 'Golok', 'Beladau', 'Keris'];
    default:
      return [];
  }
}