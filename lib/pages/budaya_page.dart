// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BudayaPage extends StatefulWidget {
  const BudayaPage({super.key});

  @override
  State<BudayaPage> createState() => _BudayaPageState();
}

class _BudayaPageState extends State<BudayaPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori Budaya',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[400],
        foregroundColor: Colors.black,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 35,
            ),
            onPressed: () {},
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
              itemCount: 6,
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
                            child: Image.network(
                              "foto_daerah, masukin urlnya",
                              width: size.width,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              "nama_daerah",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 4),
                            child: Text(
                              "Asal daerah",
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ));
              }),
        ),
      ),
    );
  }
}
