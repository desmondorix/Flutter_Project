import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatefulWidget {
  final String question;
  final String imagePath;

  const DestinationCard({
    Key? key,
    required this.question,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  late String question;
  late String imagePath;
  bool like = false;

  @override


  @override
  void initState() {
    super.initState();
    question = widget.question;
    imagePath = widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        child: Container(
          width: size.width,
          height: size.height / 2.7,
          decoration: BoxDecoration(
            color: Color(0xFFCF9C6F),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(imagePath),
                  width: size.height,
                  height: 220,
                ),
              ),
              Positioned(
                bottom: 15,
                left: 23,
                right: 23,
                child: Text(
                  question,
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
}
