import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_kategori.dart';
import 'kategori.dart';

class Detailk extends StatefulWidget {
  String id_kategori;
  String nama_kategori;
  String nama_daerah;
  String asal_daerah;
  String foto_daerah;
  String detail_daerah;

  Detailk(this.id_kategori, this.nama_kategori,
      this.nama_daerah, this.asal_daerah, this.foto_daerah, this.detail_daerah);

  @override
  State<Detailk> createState() => _DetailkState();
}

class _DetailkState extends State<Detailk> {
  late String id_kategori;
  late String nama_kategori;
  late String nama_daerah;
  late String asal_daerah;
  late String foto_daerah;
  late String detail_daerah;

  void initState() {
    id_kategori=widget.id_kategori;
    nama_kategori=widget.nama_kategori;
    nama_daerah=widget.nama_daerah;
    asal_daerah=widget.asal_daerah;
    foto_daerah=widget.foto_daerah;
    detail_daerah=widget.detail_daerah;
    super.initState();
  }

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
                builder: (context) => Kategori(),
              ),
            );
          },
        ),
        title: Text(
          nama_daerah,
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
                              child: Image.network("http://10.0.2.2/study_flutter/detail_kategori/" + foto_daerah,
                                width: size.width,
                                height: 165,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Nama: "+
                                              nama_daerah,
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFF572D15),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 2,),
                                          Text("Asal: "+
                                              asal_daerah,
                                            style: GoogleFonts.montserrat(
                                              color: Color(0xFF572D15),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 2,),
                                          Text("Kategori: "+
                                              nama_kategori,
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
                                                    detail_daerah,
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