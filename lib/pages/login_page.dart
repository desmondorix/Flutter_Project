import 'package:flutter/material.dart';
import 'package:marbel/pages/admin_page.dart';
import 'package:marbel/pages/home_page.dart';
import 'package:marbel/pages/main_page.dart';
import 'package:marbel/services.dart';
import 'package:marbel/widgets/custom_textfield_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                          image: AssetImage("assets/bg_marbel_login.png"))),
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
                          ]),
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
                        )),
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
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.chevron_left_rounded, size: 40)),
                  const Icon(
                    Icons.person_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 15),
                  const Text('LOGIN',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 60,
                  )
                ],
              ),
              CustomTextFieldHome(
                  label: "Nama", controller: usernameController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: TextButton(
                    onPressed: () async {
                      String username = usernameController.text.trim();
                      try {
                        Map? response =
                            await Services.login(username: username);

                        if (response!['message'] == 'Login successful') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(response['message'])));

                          if (mounted) {
                            if (username == 'PR480W02024') {
                              // Navigasi ke MainPage_admin jika username adalah PR480W02024'
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainPage_admin(token: ""),
                                ),
                              );
                            } else {
                              // Navigasi ke MainPage biasa jika username bukan 'prabowo'
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(
                                      usernameController: usernameController),
                                ),
                              );
                            }
                          }
                        }
                      } catch (e) {
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
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
                        )
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 60,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
