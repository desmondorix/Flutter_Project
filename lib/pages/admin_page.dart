// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marbel/pages/home_page.dart';
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
        title: Text('Admin Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black, size: 35,),
            onPressed: () {
              _showLogoutDialog();
            },
          ),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              height: 70,
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => kategori_admin()));
                      },
                      child: Text(
                        'Data Kategori',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
              height: 70,
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => detail_anggota()));
                      },
                      child: Text(
                        'Anggota',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ));
                },
              ),
            ),
          ]),
    );
  }
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Apakah Anda yakin ingin Keluar?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the login page when user confirms logout
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: TextButton.styleFrom(
                primary: Colors.red, // Set the text color to red
              ),
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
