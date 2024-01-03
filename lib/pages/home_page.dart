import 'package:flutter/material.dart';
import 'package:marbel/widgets/custom_button_home.dart';
import 'package:marbel/pages/login_page.dart';
import 'package:marbel/pages/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
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
            const Icon(
              Icons.person_rounded,
              size: 70,
              color: Colors.black,
            ),
            CustomButtonHome(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ));
                },
                buttonTextHome: "LOGIN"),
            const SizedBox(
              height: 10,
            ),
            CustomButtonHome(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RegisterPage();
                    },
                  ));
                },
                buttonTextHome: "REGISTER"),
          ],
        ),
      ),
    );
  }
}
