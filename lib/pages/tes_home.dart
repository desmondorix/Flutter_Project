import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'cintia coba ngepush',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.black,
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    // TODO: Pindah ke halaman login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage1(),
                      ),
                    );
                  },
                  child: const Text('LOgiN', style: TextStyle(fontSize: 100)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.black,
                    minimumSize: Size(200, 50),
                  ),
                  onPressed: () {
                    // TODO: Pindah ke halaman regist
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage1(),
                      ),
                    );
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
