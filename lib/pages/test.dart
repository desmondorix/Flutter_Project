import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class Makanan extends StatefulWidget {

  @override
  State<Makanan> createState() => _MakananState();
}

class _MakananState extends State<Makanan> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            color: Color(0xFF572D15),
            size: 45,
          ),
          onPressed: () {
            Navigator.pop(context,
            );
          },
        ),
        title: Text(
          "nama_kategori",
          style: GoogleFonts.montserrat(
            color: Color(0xFF572D15),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD2B69F),
      ),
      body:
      DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_batik.png"), fit: BoxFit.fill),
        ),
        child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, index) {
              return SizedBox(
                  width: size.width,
                  child: Card(
                    elevation: 10,
                    color: Color(0xFFCF9C6F),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: Image.network("foto_daerah, masukin urlnya",
                            width: size.width,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(top: 8),
                          child: Text("nama_daerah",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.only(top: 4),
                          child: Text("Asal daerah",
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
              );
            }),
      ),
    );
  }
}