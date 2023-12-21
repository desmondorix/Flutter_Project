import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'detail_jelas_kategori.dart';
import 'kategori.dart';

class Makanan extends StatefulWidget {
  String id_kategori;
  String nama_kategori;

  Makanan(this.id_kategori, this.nama_kategori);

  @override
  State<Makanan> createState() => _MakananState();
}

class _MakananState extends State<Makanan> {
  late String id_kategori;
  late String nama_kategori;
  List userdata = [];

  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/study_flutter/detail_kategori/view_data_detail.php?id=$id_kategori";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }
  void initState() {
    id_kategori=widget.id_kategori;
    nama_kategori=widget.nama_kategori;
    getrecord();
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
            Navigator.pop(context,
            );
          },
        ),
        title: Text(
          nama_kategori,
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
              image: AssetImage("assets/tari/bg_batik.png"), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: userdata.length,
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
                          Material(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: InkWell(
                              onTap: (){
                                getrecord();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>Detailk(
                                      userdata[index]["id_kategori"].toString(),
                                      userdata[index]["nama_kategori"],
                                      userdata[index]["nama_daerah"],
                                      userdata[index]["asal_daerah"],
                                      userdata[index]["foto_daerah"],
                                      userdata[index]["detail_daerah"].toString(),
                                    ))
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Image.network("http://10.0.2.2:8080/study_flutter/detail_kategori/" +
                                    userdata[index]["foto_daerah"],
                                  width: size.width,
                                  height: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(userdata[index]["nama_daerah"],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 4),
                            child: Text(userdata[index]["asal_daerah"],
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
      ),
    );
  }
}