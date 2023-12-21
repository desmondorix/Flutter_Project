import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'detail_kategori.dart';
import 'kategori.dart';

class admin_detail extends StatefulWidget {
  String id_detail;
  String nama_kategori;
  String nama_daerah;
  String asal_daerah;
  String foto_daerah;
  String detail_daerah;

  admin_detail(this.id_detail,  this.nama_kategori,
      this.nama_daerah, this.asal_daerah, this.foto_daerah, this.detail_daerah);

  @override
  State<admin_detail> createState() => _admin_detailState();
}

class _admin_detailState extends State<admin_detail> {
  late String id_detail;
  late String nama_kategori;
  late String nama_daerah;
  late String asal_daerah;
  late String foto_daerah;
  late String detail_daerah;

  void initState() {
    id_detail=widget.id_detail;
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
          title: Text("View Data "+nama_daerah),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black, size: 35,),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>MyApp())
                );
              },
            ),
          ],
        ),
        body: SizedBox(
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
                            child: Image.network("http://10.0.2.2:8080/study_flutter/detail_kategori/" + foto_daerah,
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
                                        Text("ID: "+
                                            id_detail,
                                          style: GoogleFonts.montserrat(
                                            color: Color(0xFF572D15),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
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
    );
  }
}