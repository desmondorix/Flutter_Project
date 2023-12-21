import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marbel/pages/home_page.dart';
import 'package:marbel/pages/main_page.dart';
import 'package:marbel/services.dart';
import 'package:marbel/widgets/custom_textfield_home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController kelasController = TextEditingController();

  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDisabled = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                    width: size.width,
                    height: size.height / 1.4,
                    child: const Image(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/bg_marbel_login.png")),
                  ),
                  Positioned(
                    top: 60,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 3,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/logo_marbel.png")),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white.withOpacity(0.7),
                      ),
                      child: const Text(
                        " Welcome to Marbel ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 223,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: const Text(
                        "  Mari Belajar edisi Budaya Indonesia  ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomePage();
                        },
                      ));
                    },
                    icon: const Icon(Icons.chevron_left_rounded, size: 30),
                  ),
                  const Icon(
                    Icons.person_rounded,
                    size: 35,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 15),
                  const Text('DAFTAR',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              ),
              CustomTextFieldHome(
                  label: "Nama", controller: usernameController),
              const SizedBox(height: 10),
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                    color: Colors.grey[300],
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 3,
                          offset: Offset(3, 3))
                    ]),
                child: DropdownButton(
                  hint: const Text("   Pilih Kelas"),
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  value: dropdownValue,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                        value: "Kelas 1", child: Text("   Kelas 1")),
                    DropdownMenuItem(
                        value: "Kelas 2", child: Text("   Kelas 2")),
                    DropdownMenuItem(
                        value: "Kelas 3", child: Text("   Kelas 3")),
                    DropdownMenuItem(
                        value: "Kelas 4", child: Text("   Kelas 4")),
                    DropdownMenuItem(
                        value: "Kelas 5", child: Text("   Kelas 5")),
                    DropdownMenuItem(
                        value: "Kelas 6", child: Text("   Kelas 6")),
                  ],
                  onChanged: !isDisabled
                      ? (value) {
                          setState(() {
                            dropdownValue = value.toString();
                          });
                          kelasController.text = value.toString();
                        }
                      : null,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () async {
                        String username = usernameController.text.trim();
                        String kelas = kelasController.text;
                        try {
                          Map? response = await Services.register(
                            username: username,
                            kelas: kelas,
                          );

                          if (response != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      response['message'] ?? 'Unknown error')),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const HomePage();
                              }),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Response is null')),
                            );
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                      child: const Row(
                        children: [
                          Text("Masuk",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Icon(
                            Icons.login,
                            size: 30,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
