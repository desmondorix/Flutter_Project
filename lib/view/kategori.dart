import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter_background/flutter_background.dart';

import 'detail_kategori.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List userdata = [];
  /*Future<void> grecord(String id) async {
    String uri = "http://10.0.2.2:8080/study_flutter/view_data_makanan.php?id=$id";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }*/
  Future<void> getrecord() async {
    String uri = "http://10.0.2.2/study_flutter/kategori/view_data_kategori.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    getrecord();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        title: Text('Kategori Budaya',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black, size: 35,),
            onPressed: () {
            },
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg_batik.png"), fit: BoxFit.fill),
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
                                    MaterialPageRoute(builder: (context)=>Makanan(
                                        userdata[index]["id_kategori"].toString(),
                                        userdata[index]["nama_kategori"]
                                    ))
                                );
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                child: Image.network("http://10.0.2.2/study_flutter/kategori/" +
                                    userdata[index]["foto_kategori"],
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
                            child: Text(userdata[index]["nama_kategori"],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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