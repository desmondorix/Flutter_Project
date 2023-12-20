import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marbel/pages/senjata.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Senjata(),
              ),
            );
          },
        ),
        title: Text(
          "Deskripsi",
          style: GoogleFonts.montserrat(
            color: Color(0xFF572D15),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD2B69F),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_batik.png"), fit: BoxFit.fill),
        ),
          child: SizedBox(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          height: 650,
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  child: Image(
                                    width: size.width,
                                    height: 165,
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/senjata/senjata aceh.png"),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                                          child: Column(
                                            children: [
                                              Text(
                                                "  Nama Senjata : placeholder",
                                                style: GoogleFonts.montserrat(
                                                  color: Color(0xFF572D15),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(height: 2,),
                                              Text(
                                                "Asal Senjata : placeholder",
                                                style: GoogleFonts.montserrat(
                                                  color: Color(0xFF572D15),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                              child: Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        "NLorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien orci, porta convallis elementum et, dapibus id tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lacinia, risus quis iaculis placerat, lorem orci volutpat magna, quis pretium lacus nisi ac velit. Quisque eget interdum arcu. Aliquam mi tellus, eleifend nec semper et, elementum nec purus. Curabitur a risus sit amet purus consectetur tincidunt. Aliquam ut orci non eros faucibus dictum varius eu arcu. Maecenas sed sagittis erat, ac faucibus sem. Ut finibus magna vel lorem tristique, non consequat nunc gravida. Quisque quis diam ut ipsum fringilla ornare quis nec risus. Pellentesque varius arcu id mollis euismod. Sed eu blandit orci, id accumsan tellus.",
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 12,
                                                        ),
                                                        textAlign: TextAlign.justify,
                                                      ),
                                                    ),
                                                  ]
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                  ),
                  ),
              )
      ),
    );
  }
}
