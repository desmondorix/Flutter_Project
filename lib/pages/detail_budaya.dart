import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailBudaya extends StatefulWidget {
  const DetailBudaya({super.key});

  @override
  State<DetailBudaya> createState() => _DetailBudayaState();
}

class _DetailBudayaState extends State<DetailBudaya> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail"), //judul AppBar
          centerTitle: true, //penempatan AppBar di tengah
        ),
        body:
    DecoratedBox(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/bg_batik.png"), fit : BoxFit.fill),
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
                              image: AssetImage("assets/pakaian/pakaian_batak.png"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(top: 8, left: 8),
                                    child: const Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      SizedBox(
                                      width: 4,
                                    ),
                                      Text(
                                      "Nama Pakaian : Ulos",
                                          style: TextStyle(
                                              fontSize: 14, fontWeight: FontWeight.w500),
                                    ),
                                      ]
                                    )
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(top: 8, left: 8),
                                      child: const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Asal Daerah : Sumatera Utara",
                                              style: TextStyle(
                                                  fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                          ]
                                      )
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(top: 8, left: 8),
                                      child: const Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                                child:
                                            Text(
                                              "Pakaian adat ulos merupakan busana tradisional yang berasal dari suku Batak di Indonesia, khususnya di wilayah Sumatra Utara. Pakaian ini kaya akan warna dan motif, yang menggambarkan kekayaan budaya dan filosofi masyarakat Batak. Ulos sering digunakan dalam berbagai upacara adat, seperti pernikahan dan pertemuan keagamaan, sebagai simbol kehormatan dan kebersamaan. Pakaian adat ulos umumnya terdiri dari selendang yang dibalutkan di tubuh dengan warna dan motif tertentu sesuai dengan jenis upacara atau status sosial.",
                                              style: TextStyle(
                                                  fontSize: 11, fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.justify,
                                            ),
                                            ),
                                          ]
                                      )
                                  ),
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
    )
    );
  }
}
