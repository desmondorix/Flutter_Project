import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:marbel/view/anggota.dart';
import 'package:marbel/view/kategori.dart';
import '../view/admin_kategori.dart';

class MainPage_admin extends StatefulWidget {
  final String token;
  const MainPage_admin({super.key, required this.token});

  @override
  State<MainPage_admin> createState() => _MainPage_adminState();
}

class _MainPage_adminState extends State<MainPage_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              height: 70,
              child: Builder(
                builder: (context){
                  return ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>kategori_admin())
                        );
                      },
                      child: Text('Data Kategori', style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),)
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              height: 70,
              child: Builder(
                builder: (context){
                  return ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>detail_anggota())
                        );
                      },
                      child: Text('Anggota', style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),)
                  );
                },
              ),
            ),
          ]),);
  }
}